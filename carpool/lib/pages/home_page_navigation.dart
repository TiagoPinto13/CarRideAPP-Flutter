
import 'dart:async';
import 'dart:math';
import 'package:carpool/datamodel/search_input.dart';
import 'package:carpool/pages/home_page_navigation/home_page_navigation_logic.dart';
import 'package:carpool/pages/settings_page.dart';
import 'package:carpool/pages/show_rides_page.dart';
import 'package:carpool/providers/preferences.dart';
import 'package:carpool/theme/app_colors.dart';
import 'package:carpool/ui/app_bar.dart';
import 'package:carpool/ui/app_button.dart';
import 'package:carpool/utils/strings/managers/strings_managers.dart';
import 'package:carpool/utils/strings/strings_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../datamodel/car.dart';
import '../datamodel/ride.dart';
import '../datamodel/user.dart';
import '../log_in/auth_middleware.dart';
import 'package:flutter/widgets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'chat_page.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_maps_webservice/directions.dart';

import 'notification_page.dart';

class _HomePageNavigationState extends State<HomePageNavigation> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            HomePageNavigationLogic(isDarkMode: widget.isDarkMode),
        child: _BuildHomePage(isDarkMode: widget.isDarkMode));
  }
}

class HomePageNavigation extends StatefulWidget {
  static const routeName = "/homePageNavigation";
  final bool isDarkMode;
  HomePageNavigation({super.key, required this.isDarkMode});

  @override
  State<HomePageNavigation> createState() => _HomePageNavigationState();
}

class _BuildHomePage extends StatefulWidget {
  _BuildHomePage({required this.isDarkMode});
  final isDarkMode;

  @override
  _BuildHomePageState createState() =>
      _BuildHomePageState(isDarkMode: isDarkMode);
}

class _BuildHomePageState extends State<_BuildHomePage>
    with SingleTickerProviderStateMixin {
  _BuildHomePageState({required this.isDarkMode});

  final isDarkMode;
  bool _disableFriendly = false;
  bool _saveCar = false;
  int _selectedIndex = 0;
  int _currentCar = 0;
  final TextEditingController _searchFromController = TextEditingController();
  final TextEditingController _searchToController = TextEditingController();
  final TextEditingController _searchDateController = TextEditingController();
  final TextEditingController _searchNumPassengersController =
  TextEditingController();

  final TextEditingController _publishFromController = TextEditingController();
  final TextEditingController _publishToController = TextEditingController();
  final TextEditingController _publishDateController = TextEditingController();
  final TextEditingController _publishNumPassengersController =
  TextEditingController();
  final TextEditingController _publishHourController = TextEditingController();
  final TextEditingController _publishCarNameController =
  TextEditingController();
  final TextEditingController _publishCarConsumptionController =
  TextEditingController();
  DateTime? _selectedDate;

  final placesApiClient =
  GoogleMapsPlaces(apiKey: "AIzaSyBPabXVBdwpJez-yN_lDZZpOy24VGskOuE");
  final directionsApiClient =
  GoogleMapsDirections(apiKey: "AIzaSyBPabXVBdwpJez-yN_lDZZpOy24VGskOuE");
  late Timer timer;

  Map<Passenger, int> passengerRatings = {};
  int selectedPassengersToRemove = 1;
  int scheduleIndex = 0;
  bool _isLoading = false;

  bool isNumberInRange(String text) {
    try {
      int number = int.parse(text);
      return number > 0;
    } catch (e) {
      return false;
    }
  }

  bool isNumberDouble(String text) {
    try {
      double number = double.parse(text);
      return number > 0;
    } catch (e) {
      return false;
    }
  }

  String? validateNumber(String? text, BuildContext context) {
    if (text == null || text.isEmpty) {
      return StringsManager.instance
          .getString(context, home_page_search_enter_number_of_passengers_msg);
    }
    if (!isNumberInRange(text)) {
      return StringsManager.instance
          .getString(context, home_page_search_enter_valid_number_msg);
    }
    return null;
  }

  String? validateCarConsumption(String? text, BuildContext context) {
    if (text == null || text.isEmpty) {
      return StringsManager.instance
          .getString(context, home_page_publish_enter_car_consumption);
    }
    if (!isNumberDouble(text)) {
      return StringsManager.instance
          .getString(context, home_page_publish_invalid_car_consumption);
    }
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      context: context,
      backgroundColor: AppColors.firstColor,
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.white,
            primaryColor: Colors.white,
          ),
          child: SizedBox(
            height: 300,
            child: CalendarDatePicker(
              initialDate: _selectedDate ?? DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2100, 12, 31),
              onDateChanged: (DateTime? date) {
                Navigator.of(context).pop(date);
              },
            ),
          ),
        );
      },
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        controller.text = DateFormat('yyyy-MM-dd').format(_selectedDate!);
      });
    }
  }

  void _selectHour(BuildContext context, TextEditingController controller) {
    int selectedHour = DateTime.now().hour;
    int selectedMinute = DateTime.now().minute;

    showModalBottomSheet(
      backgroundColor: AppColors.firstColor,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 50,
                  onSelectedItemChanged: (int index) {
                    selectedHour = index;
                  },
                  children: List.generate(24, (index) {
                    return Center(
                      child: Text(
                        '$index',
                        style: const TextStyle(fontSize: 24),
                      ),
                    );
                  }),
                ),
              ),
              const Text(
                ':',
                style: TextStyle(fontSize: 24),
              ),
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 50,
                  onSelectedItemChanged: (int index) {
                    selectedMinute = index;
                  },
                  children: List.generate(60, (index) {
                    return Center(
                      child: Text(
                        '$index',
                        style: const TextStyle(fontSize: 24),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    ).then((_) {
      String selectedTime =
          '${selectedHour.toString().padLeft(2, '0')}:${selectedMinute.toString().padLeft(2, '0')}';
      controller.text = selectedTime;
    });
  }

  bool _validateForm(BuildContext context) {
    if (_searchFromController.text.isEmpty) {
      _showSnackBarError(
          context,
          StringsManager.instance
              .getString(context, home_page_search_enter_start_msg));
      return false;
    }
    String? passengersError =
    validateNumber(_searchNumPassengersController.text, context);
    if (passengersError != null) {
      _showSnackBarError(context, passengersError);
      return false;
    }
    return true;
  }

  bool _validatePublishForm(BuildContext context) {
    if (_publishFromController.text.isEmpty) {
      _showSnackBarError(
          context,
          StringsManager.instance
              .getString(context, home_page_search_enter_start_msg));
      return false;
    }
    if (_publishToController.text.isEmpty) {
      _showSnackBarError(
          context,
          StringsManager.instance
              .getString(context, home_page_search_enter_destination_msg));
      return false;
    }
    if (_publishDateController.text.isEmpty) {
      _showSnackBarError(
          context,
          StringsManager.instance
              .getString(context, home_page_publish_enter_date));
      return false;
    }
    if (_publishHourController.text.isEmpty) {
      _showSnackBarError(
          context,
          StringsManager.instance
              .getString(context, home_page_publish_enter_hour));
      return false;
    }

    String? passengersError =
    validateNumber(_publishNumPassengersController.text, context);
    if (passengersError != null) {
      _showSnackBarError(context, passengersError);
      return false;
    }
    return true;
  }

  void _showSnackBarSuccess(BuildContext context, String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: message,
        backgroundColor: AppColors.eighthColor,
      ),
    );
  }

  void _showSnackBarError(BuildContext context, String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: message,
        backgroundColor: AppColors.sixthColor,
      ),
    );
  }

  Widget _buildSearchBodyCard(
      {required BuildContext context, required HomePageNavigationState state}) {
    return Card(
      color: isDarkMode ? AppColors.ninthColor : AppColors.fifthColor,
      margin: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Card(
            color: widget.isDarkMode ? AppColors.secondColor : Colors.white,
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              controller: _searchFromController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.pin_drop,
                  color: Colors.red,
                ),
                labelText: StringsManager.instance
                    .getString(context, home_page_search_from_label),
                border: InputBorder.none,
              ),
            ),
          ),
          Card(
            color: widget.isDarkMode ? AppColors.secondColor : Colors.white,
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              controller: _searchToController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.pin_drop,
                  color: Colors.green,
                ),
                labelText: StringsManager.instance
                    .getString(context, home_page_search_to_optional_label),
                border: InputBorder.none,
              ),
            ),
          ),
          Card(
            color: widget.isDarkMode ? AppColors.secondColor : Colors.white,
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              readOnly: true,
              controller: _searchDateController,
              onTap: () => _selectDate(context, _searchDateController),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.calendar_month,
                  color: Colors.black,
                ),
                labelText: StringsManager.instance
                    .getString(context, home_page_search_date_label),
                border: InputBorder.none,
              ),
            ),
          ),
          Card(
            color: widget.isDarkMode ? AppColors.secondColor : Colors.white,
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              controller: _searchNumPassengersController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.people,
                  color: Colors.black,
                ),
                labelText: StringsManager.instance.getString(
                    context, home_page_search_number_of_passengers_label),
                border: InputBorder.none,
              ),
            ),
          ),
          Card(
            color: widget.isDarkMode ? AppColors.secondColor : Colors.white,
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            shape: (RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
            child: Row(
              children: [
                Checkbox(
                  value: _disableFriendly,
                  onChanged: (newValue) {
                    setState(() {
                      _disableFriendly = newValue ?? false;
                    });
                  },
                ),
                Text(
                  StringsManager.instance.getString(context, home_page_disable),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPublishBodyCard(
      {required BuildContext context, required HomePageNavigationState state}) {
    if (state is HomePageNavigationCarsLoadedState) {
      return Card(
        color: isDarkMode ? AppColors.ninthColor : AppColors.fifthColor,
        margin: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Card(
              color: widget.isDarkMode ? AppColors.secondColor : Colors.white,
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                controller: _publishFromController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.pin_drop,
                    color: Colors.red,
                  ),
                  labelText: StringsManager.instance
                      .getString(context, home_page_search_from_label),
                  border: InputBorder.none,
                ),
              ),
            ),
            Card(
              color: widget.isDarkMode ? AppColors.secondColor : Colors.white,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                controller: _publishToController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.pin_drop,
                    color: Colors.green,
                  ),
                  labelText: StringsManager.instance
                      .getString(context, home_page_search_to_label),
                  border: InputBorder.none,
                ),
              ),
            ),
            Card(
              color: widget.isDarkMode ? AppColors.secondColor : Colors.white,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                readOnly: true,
                controller: _publishDateController,
                onTap: () => _selectDate(context, _publishDateController),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.calendar_month,
                    color: Colors.black,
                  ),
                  labelText: StringsManager.instance
                      .getString(context, home_page_search_date_label),
                  border: InputBorder.none,
                ),
              ),
            ),
            Card(
              color: widget.isDarkMode ? AppColors.secondColor : Colors.white,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                readOnly: true,
                onTap: () => _selectHour(context, _publishHourController),
                controller: _publishHourController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.access_time,
                    color: Colors.black,
                  ),
                  labelText: StringsManager.instance
                      .getString(context, home_page_search_hour_label),
                  border: InputBorder.none,
                ),
              ),
            ),
            Card(
              color: widget.isDarkMode ? AppColors.secondColor : Colors.white,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                controller: _publishNumPassengersController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.people,
                    color: Colors.black,
                  ),
                  labelText: StringsManager.instance.getString(
                      context, home_page_publish_number_of_passengers_label),
                  border: InputBorder.none,
                ),
              ),
            ),
            if (state.cars.isEmpty || _currentCar == state.cars.length)
              Card(
                color: widget.isDarkMode ? AppColors.secondColor : Colors.white,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: _publishCarNameController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.directions_car,
                      color: Colors.black,
                    ),
                    labelText: StringsManager.instance
                        .getString(context, home_page_publish_car_name),
                    border: InputBorder.none,
                  ),
                ),
              ),
            if (state.cars.isEmpty || _currentCar == state.cars.length)
              Card(
                color: widget.isDarkMode ? AppColors.secondColor : Colors.white,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: _publishCarConsumptionController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.directions_car,
                      color: Colors.black,
                    ),
                    labelText: '${StringsManager.instance
                        .getString(context, home_page_publish_car_consumption)} (L/100 km)',
                    border: InputBorder.none,
                  ),
                ),
              ),
            if (state.cars.isEmpty || _currentCar == state.cars.length)
              Card(
                color: widget.isDarkMode ? AppColors.secondColor : Colors.white,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                shape: (RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
                child: Row(
                  children: [
                    Checkbox(
                      value: _saveCar,
                      onChanged: (newValue) {
                        setState(() {
                          _saveCar = newValue ?? false;
                        });
                      },
                    ),
                    Text(
                        StringsManager.instance
                            .getString(context, home_page_publish_car_save),
                        style: TextStyle(
                            fontSize: 16.3,
                            color: Colors.black.withOpacity(0.7)))
                  ],
                ),
              ),
            if (state.cars.isNotEmpty)
              Card(
                color: widget.isDarkMode ? AppColors.secondColor : Colors.white,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.directions_car,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 10),
                          Text(
                              StringsManager.instance
                                  .getString(context, home_page_publish_car),
                              style: TextStyle(
                                  fontSize: 16.3,
                                  color: Colors.black.withOpacity(0.7))),
                        ],
                      ),
                      Row(
                        children: [
                          DropdownButton<int>(
                            value: _currentCar,
                            onChanged: (int? val) {
                              if (val != null) {
                                setState(() {
                                  _currentCar = val;
                                });
                              }
                            },
                            items: List.generate(
                              state.cars.length + 1,
                                  (index) => DropdownMenuItem<int>(
                                value: index,
                                child: index < state.cars.length
                                    ? Text(state.cars[index].name)
                                    : Text(StringsManager.instance.getString(
                                    context, home_page_navigation_other)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            Card(
              color: widget.isDarkMode ? AppColors.secondColor : Colors.white,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              shape: (RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
              child: Row(
                children: [
                  Checkbox(
                    value: _disableFriendly,
                    onChanged: (newValue) {
                      setState(() {
                        _disableFriendly = newValue ?? false;
                      });
                    },
                  ),
                  Text(
                    StringsManager.instance
                        .getString(context, home_page_disable),
                    style: TextStyle(
                        fontSize: 16.3, color: Colors.black.withOpacity(0.7)),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }
    return Center(
      child: Text(StringsManager.instance
          .getString(context, home_page_unable_to_fetch_cars)),
    );
  }

  double calculatePricePerPassenger(Ride ride) {
    if (ride.car == null) {
      throw ArgumentError('Car cannot be null for price calculation.');
    }

    double distanceInKm = MetricsHelper.extractNumericValue(ride.distance);

    if (distanceInKm <= 0) {
      throw ArgumentError('Distance must be greater than zero.');
    }

    double totalFuelConsumption = (distanceInKm * ride.car!.consumption) / 100;

    double fuelPricePerUnit = 1.75;

    double totalFuelPrice = totalFuelConsumption * fuelPricePerUnit;

    int totalPassengers = ride.passengers.length;

    if (totalPassengers <= 0) {
      throw ArgumentError('There must be at least one passenger.');
    }

    double pricePerPassenger = totalFuelPrice / totalPassengers;

    return (pricePerPassenger * 100).round() / 100;
  }

  Widget _buildScheduleActiveDriverCard(
      {required BuildContext context,
        required Ride ride,
        required int index,
        required HomePageNavigationLogic cubit}) {
    Color backGround = index % 2 == 0
        ? widget.isDarkMode
        ? AppColors.fourthColor
        : AppColors.firstColor
        : widget.isDarkMode
        ? AppColors.seventhColor
        : AppColors.fourthColor;

    Color textColor = index % 2 == 0
        ? widget.isDarkMode
        ? AppColors.eighthColor
        : AppColors.sixthColor
        : widget.isDarkMode
        ? AppColors.secondColor
        : Colors.white;

    Color priceColor = index % 2 == 0
        ? widget.isDarkMode
        ? AppColors.tenthColor
        : AppColors.ninthColor
        : widget.isDarkMode
        ? Colors.white
        : AppColors.ninthColor;

    Color contactButtonColor = index % 2 == 0
        ? widget.isDarkMode
        ? AppColors.sixthColor
        : AppColors.sixthColor
        : widget.isDarkMode
        ? AppColors.ninthColor
        : AppColors.sixthColor;

    Color joinButtonColor = index % 2 == 0
        ? widget.isDarkMode
        ? AppColors.ninthColor
        : AppColors.ninthColor
        : widget.isDarkMode
        ? AppColors.tenthColor
        : AppColors.seventhColor;

    int numSeatsAllocated = 0;
    int availableSeats = ride.maxPassengers;
    ride.passengers.forEach((key, value) {
      numSeatsAllocated += value as int;
    });

    availableSeats -= numSeatsAllocated;

    bool disable = ride.hasDisability;

    return Card(
      color: backGround,
      margin: const EdgeInsets.fromLTRB(5, 8, 5, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 6,
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        backgroundColor: backGround,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ride.driver.name[0].toUpperCase() +
                          ride.driver.name.substring(1).toLowerCase(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: priceColor,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                            '${StringsManager.instance.getString(context, show_rides_page_from)} ',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ride.startingPoint,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                            '${StringsManager.instance.getString(context, show_rides_page_to)} ',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ride.destination,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Icon(
                  ride.driver.gender == 'Gender.male'
                      ? Icons.boy_rounded
                      : Icons.girl_rounded,
                  color: priceColor,
                  size: 50,
                ),
                SizedBox(height: 5),
                Text(
                  StringsManager.instance
                      .getString(context, show_rides_page_hour) +
                      ride.hour,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                  ),
                ),
                Text(
                  ride.date,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: const SizedBox(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Text(
                  '${StringsManager.instance.getString(context, home_page_navigation_distance)} ${ride.distance}',
                  style: TextStyle(color: textColor, fontSize: 16),
                ),
                Text(
                  '${StringsManager.instance.getString(context, home_page_navigation_expected_duration)} ${ride.travelTime}',
                  style: TextStyle(color: textColor, fontSize: 16),
                ),
                Text(
                  '${StringsManager.instance.getString(context, home_page_navigation_allocated_seats)} $numSeatsAllocated',
                  style: TextStyle(color: textColor, fontSize: 16),
                ),
                Text(
                  '${StringsManager.instance.getString(context, home_page_navigation_available_seats)} $availableSeats',
                  style: TextStyle(color: textColor, fontSize: 16),
                ),
                if (disable)
                  Text(
                    StringsManager.instance.getString(context,
                        home_page_navigation_available_disable_friendly),
                    style: TextStyle(color: textColor, fontSize: 16),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                              backgroundColor: AppColors.firstColor,
                              context: context,
                              builder: (BuildContext context) {
                                Map<Passenger, dynamic> seatsPerPassenger = {};
                                ride.passengers.forEach((key, value) {
                                  Passenger p =
                                  Passenger(myUser: key, count: value);
                                  seatsPerPassenger[p] = value;
                                });

                                if (seatsPerPassenger.isEmpty) {
                                  return Center(
                                    child: Text(
                                      StringsManager.instance.getString(context,
                                          show_rides_page_no_passengers),
                                      style: const TextStyle(fontSize: 20.0),
                                    ),
                                  );
                                }

                                return ListView.builder(
                                    itemCount: seatsPerPassenger.length,
                                    itemBuilder: (context, index) {
                                      var entry = seatsPerPassenger.entries
                                          .elementAt(index);

                                      Passenger p = entry.key;

                                      String formattedName = p.myUser.name
                                          .substring(0, 1)
                                          .toUpperCase() +
                                          p.myUser.name
                                              .substring(1)
                                              .toLowerCase();

                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 60,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                          ),
                                          child: ListTile(
                                            title: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    formattedName,
                                                    style: const TextStyle(
                                                      color:
                                                      AppColors.sixthColor,
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "${StringsManager.instance.getString(context, show_rides_page_seats_by_passenger)}${p.count}",
                                                          style: const TextStyle(
                                                              color: AppColors
                                                                  .fifthColor,
                                                              fontSize: 16),
                                                        ),
                                                      ],
                                                    ))
                                              ],
                                            ),
                                            trailing: IconButton(
                                              onPressed: () async {
                                                MyUser? user =
                                                await AuthMiddleware
                                                    .getUser(
                                                  AuthMiddleware.getUserId(
                                                      context)!,
                                                );
                                                Navigator.pushNamed(
                                                  context,
                                                  ChatPage.routeName,
                                                  arguments: ContactDriver(
                                                    senderId: user!.id,
                                                    senderName: user.name,
                                                    receiverName: p.myUser.name,
                                                    receiverId: p.myUser.id,
                                                  ),
                                                );
                                              },
                                              icon: Icon(Icons.message),
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: contactButtonColor),
                        child: Text(
                          StringsManager.instance.getString(
                              context, show_rides_page_passengers_joined),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          String currentUserId =
                          AuthMiddleware.getUserId(context)!;
                          if (await cubit.removeRide(
                              userId: currentUserId, rideId: ride)) {
                            cubit.sendNotificationToAllPassengers(
                                senderId: currentUserId, ride: ride);
                            _showSnackBarSuccess(
                              context,
                              StringsManager.instance.getString(context,
                                  home_page_navigation_user_removed_success),
                            );
                          } else {
                            _showSnackBarError(
                              context,
                              StringsManager.instance.getString(context,
                                  home_page_navigation_error_removing_user),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: joinButtonColor),
                        child: Text(
                          StringsManager.instance.getString(
                              context, home_page_navigation_cancel_ride),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleExpiredDriverCard(
      {required BuildContext context,
        required Ride ride,
        required int index,
        required HomePageNavigationLogic cubit}) {
    Color backGround = index % 2 == 0
        ? widget.isDarkMode
        ? AppColors.fourthColor
        : AppColors.firstColor
        : widget.isDarkMode
        ? AppColors.seventhColor
        : AppColors.fourthColor;

    Color textColor = index % 2 == 0
        ? widget.isDarkMode
        ? AppColors.eighthColor
        : AppColors.sixthColor
        : widget.isDarkMode
        ? AppColors.secondColor
        : Colors.white;

    Color priceColor = index % 2 == 0
        ? widget.isDarkMode
        ? AppColors.tenthColor
        : AppColors.ninthColor
        : widget.isDarkMode
        ? Colors.white
        : AppColors.ninthColor;

    Color contactButtonColor = index % 2 == 0
        ? widget.isDarkMode
        ? AppColors.sixthColor
        : AppColors.sixthColor
        : widget.isDarkMode
        ? AppColors.ninthColor
        : AppColors.sixthColor;

    Color joinButtonColor = index % 2 == 0
        ? widget.isDarkMode
        ? AppColors.ninthColor
        : AppColors.ninthColor
        : widget.isDarkMode
        ? AppColors.tenthColor
        : AppColors.seventhColor;

    int numSeatsAllocated = 0;
    int availableSeats = ride.maxPassengers;
    ride.passengers.forEach((key, value) {
      numSeatsAllocated += value as int;
    });

    availableSeats -= numSeatsAllocated;

    bool disable = ride.hasDisability;

    return Card(
      color: backGround,
      margin: const EdgeInsets.fromLTRB(5, 8, 5, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 6,
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        backgroundColor: backGround,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ride.driver.name[0].toUpperCase() +
                          ride.driver.name.substring(1).toLowerCase(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: priceColor,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                            '${StringsManager.instance.getString(context, show_rides_page_from)} ',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ride.startingPoint,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                            '${StringsManager.instance.getString(context, show_rides_page_to)} ',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ride.destination,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Icon(
                  ride.driver.gender == 'Gender.male'
                      ? Icons.boy_rounded
                      : Icons.girl_rounded,
                  color: priceColor,
                  size: 50,
                ),
                SizedBox(height: 5),
                Text(
                  StringsManager.instance
                      .getString(context, show_rides_page_hour) +
                      ride.hour,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                  ),
                ),
                Text(
                  ride.date,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: const SizedBox(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Text(
                  '${StringsManager.instance.getString(context, home_page_navigation_distance)} ${ride.distance}',
                  style: TextStyle(color: textColor, fontSize: 16),
                ),
                Text(
                  '${StringsManager.instance.getString(context, home_page_navigation_expected_duration)} ${ride.travelTime}',
                  style: TextStyle(color: textColor, fontSize: 16),
                ),
                Text(
                  '${StringsManager.instance.getString(context, home_page_navigation_allocated_seats)} $numSeatsAllocated',
                  style: TextStyle(color: textColor, fontSize: 16),
                ),
                Text(
                  '${StringsManager.instance.getString(context, home_page_navigation_available_seats)} $availableSeats',
                  style: TextStyle(color: textColor, fontSize: 16),
                ),
                if (disable)
                  Text(
                    StringsManager.instance.getString(context,
                        home_page_navigation_available_disable_friendly),
                    style: TextStyle(color: textColor, fontSize: 16),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleWaitingDriverCard(
      {required BuildContext context,
        required Ride ride,
        required int index,
        required HomePageNavigationLogic cubit}) {
    Color backGround = index % 2 == 0
        ? widget.isDarkMode
        ? AppColors.fourthColor
        : AppColors.firstColor
        : widget.isDarkMode
        ? AppColors.seventhColor
        : AppColors.fourthColor;

    Color textColor = index % 2 == 0
        ? widget.isDarkMode
        ? AppColors.eighthColor
        : AppColors.sixthColor
        : widget.isDarkMode
        ? AppColors.secondColor
        : Colors.white;

    Color priceColor = index % 2 == 0
        ? widget.isDarkMode
        ? AppColors.tenthColor
        : AppColors.ninthColor
        : widget.isDarkMode
        ? Colors.white
        : AppColors.ninthColor;

    Color contactButtonColor = index % 2 == 0
        ? widget.isDarkMode
        ? AppColors.sixthColor
        : AppColors.sixthColor
        : widget.isDarkMode
        ? AppColors.ninthColor
        : AppColors.sixthColor;

    Color joinButtonColor = index % 2 == 0
        ? widget.isDarkMode
        ? AppColors.ninthColor
        : AppColors.ninthColor
        : widget.isDarkMode
        ? AppColors.tenthColor
        : AppColors.seventhColor;

    int numSeatsAllocated = 0;
    int availableSeats = ride.maxPassengers;
    ride.passengers.forEach((key, value) {
      numSeatsAllocated += value as int;
    });

    availableSeats -= numSeatsAllocated;

    bool disable = ride.hasDisability;

    List<Passenger> ratedPassengers = [];
    ride.passengers.forEach((key, value) {
      Passenger p = Passenger(myUser: key, count: value);
      if (!ride.rated.contains(p.myUser.id as dynamic)) {
        ratedPassengers.add(p);
      }
    });

    return Card(
      color: backGround,
      margin: const EdgeInsets.fromLTRB(5, 8, 5, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 6,
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        backgroundColor: backGround,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ride.driver.name[0].toUpperCase() +
                          ride.driver.name.substring(1).toLowerCase(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: priceColor,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                            '${StringsManager.instance.getString(context, show_rides_page_from)} ',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ride.startingPoint,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                            '${StringsManager.instance.getString(context, show_rides_page_to)} ',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ride.destination,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Icon(
                  ride.driver.gender == 'Gender.male'
                      ? Icons.boy_rounded
                      : Icons.girl_rounded,
                  color: priceColor,
                  size: 50,
                ),
                SizedBox(height: 5),
                Text(
                  StringsManager.instance
                      .getString(context, show_rides_page_hour) +
                      ride.hour,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                  ),
                ),
                Text(
                  ride.date,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: const SizedBox(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Text(
                  '${StringsManager.instance.getString(context, home_page_navigation_distance)} ${ride.distance}',
                  style: TextStyle(color: textColor, fontSize: 16),
                ),
                Text(
                  '${StringsManager.instance.getString(context, home_page_navigation_expected_duration)} ${ride.travelTime}',
                  style: TextStyle(color: textColor, fontSize: 16),
                ),
                Text(
                  '${StringsManager.instance.getString(context, home_page_navigation_allocated_seats)} $numSeatsAllocated',
                  style: TextStyle(color: textColor, fontSize: 16),
                ),
                Text(
                  '${StringsManager.instance.getString(context, home_page_navigation_available_seats)} $availableSeats',
                  style: TextStyle(color: textColor, fontSize: 16),
                ),
                if (disable)
                  Text(
                    StringsManager.instance.getString(context,
                        home_page_navigation_available_disable_friendly),
                    style: TextStyle(color: textColor, fontSize: 16),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (ratedPassengers.isNotEmpty)
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _showModalBottomSheet(
                                context, ratedPassengers, cubit, ride);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: contactButtonColor),
                          child: Text(
                            StringsManager.instance.getString(
                                context, show_rides_page_passengers_joined),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          cubit.confirmRide(rideId: ride.id);
                          cubit.sendConfirmationNotificationToUsers(
                              senderId: AuthMiddleware.getUserId(context)!,
                              ride: ride);
                          _showSnackBarSuccess(
                              context,
                              StringsManager.instance.getString(context,
                                  home_page_navigation_ride_confirm_notifications_sent_sucessfully));
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: joinButtonColor),
                        child: Text(
                          StringsManager.instance.getString(
                              context, home_page_navigation_confirm_ride),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleActivePassengerCard(
      {required BuildContext context,
        required Ride ride,
        required int index,
        required int numPass,
        required HomePageNavigationLogic cubit}) {
    Color backGround = index % 2 == 0
        ? widget.isDarkMode
        ? AppColors.fourthColor
        : AppColors.firstColor
        : widget.isDarkMode
        ? AppColors.seventhColor
        : AppColors.fourthColor;

    Color textColor = index % 2 == 0
        ? widget.isDarkMode
        ? AppColors.eighthColor
        : AppColors.sixthColor
        : widget.isDarkMode
        ? AppColors.secondColor
        : Colors.white;

    Color priceColor = index % 2 == 0
        ? widget.isDarkMode
        ? AppColors.tenthColor
        : AppColors.ninthColor
        : widget.isDarkMode
        ? Colors.white
        : AppColors.ninthColor;

    Color contactButtonColor = index % 2 == 0
        ? widget.isDarkMode
        ? AppColors.sixthColor
        : AppColors.sixthColor
        : widget.isDarkMode
        ? AppColors.ninthColor
        : AppColors.sixthColor;

    Color joinButtonColor = index % 2 == 0
        ? widget.isDarkMode
        ? AppColors.ninthColor
        : AppColors.ninthColor
        : widget.isDarkMode
        ? AppColors.tenthColor
        : AppColors.seventhColor;

    if (numPass < selectedPassengersToRemove) {
      selectedPassengersToRemove = 1;
    }

    bool disable = ride.hasDisability;
    double pricePerPassenger = calculatePricePerPassenger(ride);

    return Card(
      color: backGround,
      margin: const EdgeInsets.fromLTRB(5, 8, 5, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 6,
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        backgroundColor: backGround,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ride.driver.name[0].toUpperCase() +
                          ride.driver.name.substring(1).toLowerCase(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: priceColor,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                            '${StringsManager.instance.getString(context, show_rides_page_from)} ',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ride.startingPoint,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                            '${StringsManager.instance.getString(context, show_rides_page_to)} ',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ride.destination,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Icon(
                  ride.driver.gender == 'Gender.male'
                      ? Icons.boy_rounded
                      : Icons.girl_rounded,
                  color: priceColor,
                  size: 50,
                ),
                const SizedBox(height: 5),
                Text(
                  StringsManager.instance
                      .getString(context, show_rides_page_hour) +
                      ride.hour,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                  ),
                ),
                Text(
                  ride.date,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: const SizedBox(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                // Additional information shown when expanded
                Text(
                  '${StringsManager.instance.getString(context, home_page_navigation_distance)} ${ride.distance}',
                  style: TextStyle(color: textColor, fontSize: 16),
                ),
                Text(
                  '${StringsManager.instance.getString(context, home_page_navigation_expected_duration)} ${ride.travelTime}',
                  style: TextStyle(color: textColor, fontSize: 16),
                ),
                Text(
                  '${StringsManager.instance.getString(context, home_page_navigation_reserved_seats)} ${numPass}',
                  style: TextStyle(color: textColor, fontSize: 16),
                ),
                if (ride.passengers.isNotEmpty)
                  Text(
                    '${StringsManager.instance.getString(context, home_page_navigation_price_per_passenger)} $pricePerPassenger€',
                    style: TextStyle(color: textColor, fontSize: 16),
                  ),
                if (disable)
                  Text(
                    StringsManager.instance.getString(context,
                        home_page_navigation_available_disable_friendly),
                    style: TextStyle(color: textColor, fontSize: 16),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${StringsManager.instance.getString(context, home_page_navigation_seats_to_remove)} ",
                      style: TextStyle(color: joinButtonColor, fontSize: 16),
                    ),
                    DropdownButton<int>(
                      value: selectedPassengersToRemove,
                      onChanged: (int? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedPassengersToRemove = newValue;
                          });
                        }
                      },
                      items: List.generate(
                        numPass,
                            (index) => DropdownMenuItem<int>(
                          value: index + 1,
                          child: Text('${index + 1}'),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          MyUser? user = await AuthMiddleware.getUser(
                            AuthMiddleware.getUserId(context)!,
                          );
                          Navigator.pushNamed(
                            context,
                            ChatPage.routeName,
                            arguments: ContactDriver(
                              senderId: user!.id,
                              senderName: user.name,
                              receiverName: ride.driver.name,
                              receiverId: ride.driver.id,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: contactButtonColor,
                        ),
                        child: Text(
                          StringsManager.instance.getString(
                            context,
                            show_rides_page_contact_driver,
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          String currentUserId =
                          AuthMiddleware.getUserId(context)!;
                          if (await cubit.removeUserFromRide(
                              userId: currentUserId,
                              rideId: ride,
                              numPass: selectedPassengersToRemove,
                              totalNum: numPass)) {
                            cubit.sendWithdrawNotificationToDriver(
                                senderId: currentUserId,
                                ride: ride,
                                numPass: selectedPassengersToRemove);
                            _showSnackBarSuccess(
                              context,
                              StringsManager.instance.getString(
                                context,
                                home_page_navigation_user_removed_success,
                              ),
                            );
                          } else {
                            _showSnackBarError(
                              context,
                              StringsManager.instance.getString(
                                context,
                                home_page_navigation_error_removing_user,
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: joinButtonColor,
                        ),
                        child: Text(
                          StringsManager.instance.getString(
                            context,
                            home_page_navigation_remove_seats,
                          ),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleExpiredPassengerCard(
      {required BuildContext context,
        required Ride ride,
        required int index,
        required int numPass,
        required HomePageNavigationLogic cubit}) {
    Color backGround = index % 2 == 0
        ? widget.isDarkMode
        ? AppColors.fourthColor
        : AppColors.firstColor
        : widget.isDarkMode
        ? AppColors.seventhColor
        : AppColors.fourthColor;

    Color textColor = index % 2 == 0
        ? widget.isDarkMode
        ? AppColors.eighthColor
        : AppColors.sixthColor
        : widget.isDarkMode
        ? AppColors.secondColor
        : Colors.white;

    Color priceColor = index % 2 == 0
        ? widget.isDarkMode
        ? AppColors.tenthColor
        : AppColors.ninthColor
        : widget.isDarkMode
        ? Colors.white
        : AppColors.ninthColor;

    Color contactButtonColor = index % 2 == 0
        ? widget.isDarkMode
        ? AppColors.sixthColor
        : AppColors.sixthColor
        : widget.isDarkMode
        ? AppColors.ninthColor
        : AppColors.sixthColor;

    Color joinButtonColor = index % 2 == 0
        ? widget.isDarkMode
        ? AppColors.ninthColor
        : AppColors.ninthColor
        : widget.isDarkMode
        ? AppColors.tenthColor
        : AppColors.seventhColor;

    if (numPass < selectedPassengersToRemove) {
      selectedPassengersToRemove = 1;
    }

    bool disable = ride.hasDisability;
    double pricePerPassenger = calculatePricePerPassenger(ride);

    return Card(
      color: backGround,
      margin: const EdgeInsets.fromLTRB(5, 8, 5, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 6,
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        backgroundColor: backGround,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ride.driver.name[0].toUpperCase() +
                          ride.driver.name.substring(1).toLowerCase(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: priceColor,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                            '${StringsManager.instance.getString(context, show_rides_page_from)} ',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ride.startingPoint,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                            '${StringsManager.instance.getString(context, show_rides_page_to)} ',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ride.destination,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Icon(
                  ride.driver.gender == 'Gender.male'
                      ? Icons.boy_rounded
                      : Icons.girl_rounded,
                  color: priceColor,
                  size: 50,
                ),
                const SizedBox(height: 5),
                Text(
                  StringsManager.instance
                      .getString(context, show_rides_page_hour) +
                      ride.hour,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                  ),
                ),
                Text(
                  ride.date,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: const SizedBox(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Text(
                  '${StringsManager.instance.getString(context, home_page_navigation_distance)} ${ride.distance}',
                  style: TextStyle(color: textColor, fontSize: 16),
                ),
                Text(
                  '${StringsManager.instance.getString(context, home_page_navigation_expected_duration)} ${ride.travelTime}',
                  style: TextStyle(color: textColor, fontSize: 16),
                ),
                Text(
                  '${StringsManager.instance.getString(context, home_page_navigation_reserved_seats)} $numPass',
                  style: TextStyle(color: textColor, fontSize: 16),
                ),
                if (ride.passengers.isNotEmpty)
                  Text(
                    '${StringsManager.instance.getString(context, home_page_navigation_price_per_passenger)} $pricePerPassenger€',
                    style: TextStyle(color: textColor, fontSize: 16),
                  ),
                if (disable)
                  Text(
                    StringsManager.instance.getString(context,
                        home_page_navigation_available_disable_friendly),
                    style: TextStyle(color: textColor, fontSize: 16),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          MyUser? user = await AuthMiddleware.getUser(
                            AuthMiddleware.getUserId(context)!,
                          );
                          Navigator.pushNamed(
                            context,
                            ChatPage.routeName,
                            arguments: ContactDriver(
                              senderId: user!.id,
                              senderName: user.name,
                              receiverName: ride.driver.name,
                              receiverId: ride.driver.id,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: contactButtonColor,
                        ),
                        child: Text(
                          StringsManager.instance.getString(
                            context,
                            show_rides_page_contact_driver,
                          ),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPublishButton(
      {required BuildContext context,
        required HomePageNavigationState state,
        required HomePageNavigationLogic cubit}) {
    if (state is HomePageNavigationCarsLoadedState) {
      return CarpoolButton.primary(
        title:
        StringsManager.instance.getString(context, home_page_publish_label),
        onTap: () async {
          if (_validatePublishForm(context)) {
            if (state.cars.isEmpty || _currentCar == state.cars.length) {
              if (_publishCarNameController.text.isEmpty) {
                _showSnackBarError(context, home_page_publish_enter_car_name);
                return;
              }

              String? consumptionErro = validateCarConsumption(
                  _publishCarConsumptionController.text, context);
              if (consumptionErro != null) {
                _showSnackBarError(context, consumptionErro);
                return;
              }
            }

            if (_saveCar) {
              _saveCar = false;
              await cubit.addCarToUser(
                  userId: AuthMiddleware.getUserId(context)!,
                  carName: _publishCarNameController.text,
                  consumption:
                  double.parse(_publishCarConsumptionController.text) *
                      1.0);
            }

            if (AuthMiddleware.isLoggedIn(context)) {
              setState(() {
                _isLoading = true;
              });

              final sourceResponse =
              await placesApiClient.autocomplete(_publishToController.text);
              if (sourceResponse.isOkay &&
                  sourceResponse.predictions.isNotEmpty) {
                String? selectedSource =
                    sourceResponse.predictions.first.description;
                _publishToController.text = selectedSource!;
              } else {
                _showSnackBarError(context, StringsManager.instance.getString(context, home_page_publish_google_autocomplete));
                setState(() {
                  _isLoading = false;
                });
                print('Error or no predictions for source address');
                return;
              }

              final destinationResponse = await placesApiClient
                  .autocomplete(_publishFromController.text);
              if (destinationResponse.isOkay &&
                  destinationResponse.predictions.isNotEmpty) {
                String? selectedDestination =
                    destinationResponse.predictions.first.description;
                _publishFromController.text = selectedDestination!;
              } else {
                _showSnackBarError(context, StringsManager.instance.getString(context, home_page_publish_google_autocomplete));
                setState(() {
                  _isLoading = false;
                });
                print('Error or no predictions for destination address');
                return;
              }

              final directionsResponse =
              await directionsApiClient.directionsWithAddress(
                _publishFromController.text,
                _publishToController.text,
                travelMode: TravelMode.driving,
              );

              if (directionsResponse.isOkay) {
                final travelTime =
                    directionsResponse.routes.first.legs.first.duration.text;
                final distance =
                    directionsResponse.routes.first.legs.first.distance.text;
                final fromLat = directionsResponse
                    .routes.first.legs.first.startLocation.lat;
                final fromLng = directionsResponse
                    .routes.first.legs.first.startLocation.lng;
                final toLat =
                    directionsResponse.routes.first.legs.first.endLocation.lat;
                final toLng =
                    directionsResponse.routes.first.legs.first.endLocation.lng;

                if (await cubit.publishRide(
                  id: AuthMiddleware.getUserId(context),
                  to: _publishToController.text,
                  toLat: toLat,
                  toLng: toLng,
                  from: _publishFromController.text,
                  fromLat: fromLat,
                  fromLng: fromLng,
                  travelTime: travelTime,
                  distance: distance,
                  date: _publishDateController.text,
                  hour: _publishHourController.text,
                  numPassengers:
                  int.parse(_publishNumPassengersController.text),
                  car: (_currentCar == state.cars.length || state.cars.isEmpty)
                      ? Car(
                      name: _publishCarNameController.text,
                      consumption: double.parse(
                          _publishCarConsumptionController.text) *
                          1.0)
                      : state.cars[_currentCar],
                  disable: _disableFriendly,
                  confirmed: false,
                )) {
                  _publishHourController.clear();
                  _publishFromController.clear();
                  _publishToController.clear();
                  _publishDateController.clear();
                  _publishCarNameController.clear();
                  _publishCarConsumptionController.clear();
                  _publishNumPassengersController.clear();

                  _showSnackBarSuccess(
                      context,
                      StringsManager.instance.getString(context,
                          home_page_navigation_ride_added_successfully));

                  cubit.fetchSchedule(
                      userId: AuthMiddleware.getUserId(context)!);

                  setState(() {
                    _selectedIndex = 3;
                    scheduleIndex = 0;
                    _isLoading = false;
                  });
                } else {
                  setState(() {
                    _isLoading = false;
                  });
                  _showSnackBarError(
                      context,
                      StringsManager.instance.getString(
                          context, home_page_navigation_failed_to_add_ride));
                }
              } else {
                _showSnackBarError(context, StringsManager.instance.getString(context, home_page_publish_google_unable));
                setState(() {
                  _isLoading = false;
                });
                print(
                    'Error retrieving directions: ${directionsResponse.errorMessage}');
                return;
              }
            } else {
              _showSnackBarError(context, StringsManager.instance.getString(context, home_page_publish_google_unable));
              AuthMiddleware.navigateIfLoggedIn(context);
              setState(() {
                _isLoading = false;
              });
            }
          }
        },
        width: 120,
        height: 60,
        borderRadius: 5,
        isDarkMode: state.isDarkMode,
        textSize: ButtonTextSize.high,
      );
    }
    return SizedBox();
  }

  Widget _buildSearchButton(
      {required BuildContext context,
        required HomePageNavigationState state,
        required HomePageNavigationLogic cubit}) {
    return CarpoolButton.primary(
      title: StringsManager.instance.getString(context, home_page_search_label),
      onTap: () async {
        if (_validateForm(context)) {
          if (!AuthMiddleware.isLoggedIn(context)) {
            AuthMiddleware.navigateIfLoggedIn(context);
          } else {
            setState(() {
              _isLoading = true;
            });

            double? fromLat;
            double? fromLng;
            final sourceResponse =
            await placesApiClient.autocomplete(_searchFromController.text);
            if (sourceResponse.isOkay &&
                sourceResponse.predictions.isNotEmpty) {
              String placeId = sourceResponse.predictions.first.placeId!;
              final placeDetailsResponse =
              await placesApiClient.getDetailsByPlaceId(placeId);
              if (placeDetailsResponse.isOkay) {
                String selectedFrom =
                sourceResponse.predictions.first.description!;
                _searchFromController.text = selectedFrom;
                fromLat = placeDetailsResponse.result.geometry?.location.lat;
                fromLng = placeDetailsResponse.result.geometry?.location.lng;
              } else {
                StringsManager.instance.getString(context, home_page_publish_google_autocomplete);
                setState(() {
                  _isLoading = false;
                });
                print('Error fetching place details for selected prediction');
              }
            } else {
              StringsManager.instance.getString(context, home_page_publish_google_autocomplete);
              setState(() {
                _isLoading = false;
              });
              print('Error or no predictions for from address');
              return;
            }

            double? toLat;
            double? toLng;
            if (_searchToController.text.isNotEmpty) {
              final destinationResponse =
              await placesApiClient.autocomplete(_searchToController.text);
              if (destinationResponse.isOkay &&
                  destinationResponse.predictions.isNotEmpty) {
                String placeId = destinationResponse.predictions.first.placeId!;
                final placeDetailsResponse =
                await placesApiClient.getDetailsByPlaceId(placeId);
                if (placeDetailsResponse.isOkay) {
                  String selectedTo =
                  destinationResponse.predictions.first.description!;
                  _searchToController.text = selectedTo;
                  toLat = placeDetailsResponse.result.geometry?.location.lat;
                  toLng = placeDetailsResponse.result.geometry?.location.lng;
                } else {
                  StringsManager.instance.getString(context, home_page_publish_google_unable);
                  setState(() {
                    _isLoading = false;
                  });
                  print('Error fetching place details for selected prediction');
                }
              } else {
                StringsManager.instance.getString(context, home_page_publish_google_unable);
                setState(() {
                  _isLoading = false;
                });
                print('Error or no predictions for to address');
                return;
              }
            }

            Navigator.pushNamed(
              context,
              ShowRidesPage.routeName,
              arguments: SearchInput(
                fromLat: fromLat!,
                fromLng: fromLng!,
                toLat: toLat,
                toLng: toLng,
                date: _selectedDate,
                disability: _disableFriendly,
                passengers: _searchNumPassengersController.text.isNotEmpty
                    ? int.parse(_searchNumPassengersController.text)
                    : 0,
              ),
            );

            _searchToController.clear();
            _searchFromController.clear();
            _searchDateController.clear();
            _searchNumPassengersController.clear();

            setState(() {
              _isLoading = false;
            });
          }
        }
      },
      width: 120,
      height: 60,
      borderRadius: 5,
      isDarkMode: state.isDarkMode,
      textSize: ButtonTextSize.high,
    );
  }

  Widget _buildSearchTab(
      {required BuildContext context,
        required HomePageNavigationState state,
        required HomePageNavigationLogic cubit}) {
    return SingleChildScrollView(
      child: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            StringsManager.instance.getString(
                context, home_page_navigation_search_quote_one),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          Text(
            StringsManager.instance.getString(
                context, home_page_navigation_search_quote_two),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          _buildSearchBodyCard(context: context, state: state),
          const SizedBox(height: 50),
          _buildSearchButton(
              context: context, state: state, cubit: cubit),
        ],
      ),
    );
  }

  Widget _buildPublishTab(
      {required BuildContext context,
        required HomePageNavigationState state,
        required HomePageNavigationLogic cubit}) {
    return SingleChildScrollView(
      child: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            StringsManager.instance.getString(
                context, home_page_navigation_publish_quote_one),
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700),
          ),
          Text(
            StringsManager.instance.getString(
                context, home_page_navigation_publish_quote_two),
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700),
          ),
          _buildPublishBodyCard(context: context, state: state),
          _buildPublishButton(
              context: context, state: state, cubit: cubit),
        ],
      ),
    );
  }

  Widget _buildMessageTab({
    required BuildContext context,
    required HomePageNavigationState state,
    required HomePageNavigationLogic cubit,
  }) {
    if (AuthMiddleware.isLoggedIn(context)) {
      return StreamBuilder<Map<dynamic, int>>(
        stream: cubit.loadChatsSub2(id: AuthMiddleware.getUserId(context)!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                '${StringsManager.instance.getString(context, home_page_navigation_error_loading_chats)}${snapshot.error}',
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            );
          } else if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  StringsManager.instance.getString(
                      context, home_page_navigation_message_quote_one),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Text(
                  StringsManager.instance.getString(
                      context, home_page_navigation_message_quote_two),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                if (snapshot.data!.length == 0)
                  const SizedBox(height: 25),
                if (snapshot.data!.length == 0)
                  Center(
                    child: Text(
                      StringsManager.instance
                          .getString(context, home_page_navigation_no_chats),
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                if (snapshot.data!.length > 0)
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final entry = snapshot.data!.entries.elementAt(index);
                        final unreadMessages = entry.value;

                        return ChatItem(
                          data: entry.key,
                          index: index,
                          unreadMessages: unreadMessages,
                          isDarkMode: widget.isDarkMode,
                          pt: PreferencesService.isPt(),
                        );
                      },
                    ),
                  ),
              ],
            );
          } else {
            return Center(
              child: Text(
                StringsManager.instance
                    .getString(context, home_page_navigation_no_chats),
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            );
          }
        },
      );
    }

    return Text(StringsManager.instance
        .getString(context, home_page_navigation_please_login));
  }

  Widget _buildScheduleTab({
    required BuildContext context,
    required HomePageNavigationState state,
    required HomePageNavigationLogic cubit,
  }) {
    if (state is HomePageNavigationLoadingState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is HomePageNavigationScheduleLoadedState) {
      return DefaultTabController(
        length: 3,
        initialIndex: scheduleIndex,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: TabBar(
                indicatorColor: widget.isDarkMode
                    ? AppColors.tenthColor
                    : AppColors.fourthColor,
                dividerColor: widget.isDarkMode
                    ? AppColors.tenthColor
                    : AppColors.fourthColor,
                labelColor: widget.isDarkMode
                    ? AppColors.tenthColor
                    : AppColors.fourthColor,
                tabs: [
                  Tab(
                    text: StringsManager.instance
                        .getString(context, home_page_navigation_active),
                  ),
                  Tab(
                    text: StringsManager.instance
                        .getString(context, home_page_navigation_waiting),
                  ),
                  Tab(
                    text: StringsManager.instance
                        .getString(context, home_page_navigation_expired),
                  ),
                ],
                onTap: (index) {
                  scheduleIndex = index; // Update the global variable
                },
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Content for the first tab
                  !(state.activeRidesAsDriver.isEmpty &&
                      state.activeRidesAsPassenger.isEmpty)
                      ? SingleChildScrollView(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            StringsManager.instance.getString(context,
                                home_page_navigation_schedule_quote_one),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            StringsManager.instance.getString(context,
                                home_page_navigation_schedule_quote_two),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: ListView.builder(
                              itemCount:
                              state.activeRidesAsDriver.length +
                                  state.activeRidesAsPassenger.length,
                              itemBuilder: (context, index) {
                                // Handle item creation based on index
                                if (index <
                                    state.activeRidesAsDriver.length) {
                                  return _buildScheduleActiveDriverCard(
                                      context: context,
                                      ride: state
                                          .activeRidesAsDriver[index],
                                      index: index,
                                      cubit: cubit);
                                } else {
                                  final passengerIndex = index -
                                      state.activeRidesAsDriver.length;
                                  final rideEntry = state
                                      .activeRidesAsPassenger.entries
                                      .elementAt(passengerIndex);

                                  final ride = rideEntry.key;
                                  final numPass = rideEntry.value;

                                  return _buildScheduleActivePassengerCard(
                                    context: context,
                                    ride: ride,
                                    index: index,
                                    numPass: numPass,
                                    cubit: cubit,
                                  );
                                }
                              },
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              cubit.fetchSchedule(
                                userId:
                                AuthMiddleware.getUserId(context)!,
                                isLoadMore: true,
                              );
                              setState(() {
                                scheduleIndex = 0;
                              });
                            },
                            icon: Icon(Icons.add),
                            color: Colors.blueAccent,
                          ),
                          const SizedBox(height: 230),
                        ],
                      ),
                    ),
                  )
                      : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringsManager.instance.getString(context,
                              home_page_navigation_no_active_rides_one),
                        ),
                        Text(
                          StringsManager.instance.getString(context,
                              home_page_navigation_no_active_rides_two),
                        ),
                      ],
                    ),
                  ),
                  // Content for the second tab
                  !(state.waitingRidesAsDriver.isEmpty &&
                      state.waitingRidesAsPassenger.isEmpty)
                      ? SingleChildScrollView(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            StringsManager.instance.getString(context,
                                home_page_navigation_schedule_quote_one_expired),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            StringsManager.instance.getString(context,
                                home_page_navigation_schedule_quote_two_expired),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: ListView.builder(
                              itemCount: state
                                  .waitingRidesAsDriver.length +
                                  state.waitingRidesAsPassenger.length,
                              itemBuilder: (context, index) {
                                // Handle item creation based on index
                                if (index <
                                    state.waitingRidesAsDriver.length) {
                                  return _buildScheduleWaitingDriverCard(
                                      context: context,
                                      ride: state
                                          .waitingRidesAsDriver[index],
                                      index: index,
                                      cubit: cubit);
                                } else {
                                  final passengerIndex = index -
                                      state.waitingRidesAsDriver.length;
                                  final rideEntry = state
                                      .waitingRidesAsPassenger.entries
                                      .elementAt(passengerIndex);

                                  final ride = rideEntry.key;
                                  final numPass = rideEntry.value;

                                  return _buildScheduleExpiredPassengerCard(
                                    context: context,
                                    ride: ride,
                                    index: index,
                                    numPass: numPass,
                                    cubit: cubit,
                                  );
                                }
                              },
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              cubit.fetchSchedule(
                                userId:
                                AuthMiddleware.getUserId(context)!,
                                isLoadMore: true,
                              );
                              setState(() {
                                scheduleIndex = 1;
                              });
                            },
                            icon: Icon(Icons.add),
                            color: Colors.blueAccent,
                          ),
                          const SizedBox(height: 230),
                        ],
                      ),
                    ),
                  )
                      : Center(
                    child: Text(
                      StringsManager.instance.getString(
                          context, home_page_navigation_no_expired_rides),
                    ),
                  ),
                  // Content for the third tab
                  !(state.expiredRidesAsDriver.isEmpty &&
                      state.expiredRidesAsPassenger.isEmpty)
                      ? SingleChildScrollView(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            StringsManager.instance.getString(context,
                                home_page_navigation_schedule_quote_one_expired),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            StringsManager.instance.getString(context,
                                home_page_navigation_schedule_quote_two_expired),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: ListView.builder(
                              itemCount: state
                                  .expiredRidesAsDriver.length +
                                  state.expiredRidesAsPassenger.length,
                              itemBuilder: (context, index) {
                                // Handle item creation based on index
                                if (index <
                                    state.expiredRidesAsDriver.length) {
                                  return _buildScheduleExpiredDriverCard(
                                      context: context,
                                      ride: state
                                          .expiredRidesAsDriver[index],
                                      index: index,
                                      cubit: cubit);
                                } else {
                                  final passengerIndex = index -
                                      state.expiredRidesAsDriver.length;
                                  final rideEntry = state
                                      .expiredRidesAsPassenger.entries
                                      .elementAt(passengerIndex);

                                  final ride = rideEntry.key;
                                  final numPass = rideEntry.value;

                                  return _buildScheduleExpiredPassengerCard(
                                    context: context,
                                    ride: ride,
                                    index: index,
                                    numPass: numPass,
                                    cubit: cubit,
                                  );
                                }
                              },
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              cubit.fetchSchedule(
                                userId:
                                AuthMiddleware.getUserId(context)!,
                                isLoadMore: true,
                              );

                              setState(() {
                                scheduleIndex = 2;
                              });
                            },
                            icon: Icon(Icons.add),
                            color: Colors.blueAccent,
                          ),
                          const SizedBox(height: 230),
                        ],
                      ),
                    ),
                  )
                      : Center(
                    child: Text(
                      StringsManager.instance.getString(
                          context, home_page_navigation_no_expired_rides),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else if (state is HomePageNavigationErrorState) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            StringsManager.instance.getString(context, state.message),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      );
    }
    return Container();
  }

  /*
  Widget _buildScheduleTab(
      {required BuildContext context,
      required HomePageNavigationState state,
      required HomePageNavigationLogic cubit}) {
    if (state is HomePageNavigationLoadingState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is HomePageNavigationScheduleLoadedState) {
      return DefaultTabController(
        length: 3,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: TabBar(
                indicatorColor: widget.isDarkMode
                    ? AppColors.tenthColor
                    : AppColors.fourthColor,
                dividerColor: widget.isDarkMode
                    ? AppColors.tenthColor
                    : AppColors.fourthColor,
                labelColor: widget.isDarkMode
                    ? AppColors.tenthColor
                    : AppColors.fourthColor,
                tabs: [
                  Tab(
                    text: StringsManager.instance
                        .getString(context, home_page_navigation_active),
                  ),
                  Tab(
                    text: StringsManager.instance
                        .getString(context, home_page_navigation_waiting),
                  ),
                  Tab(
                    text: StringsManager.instance
                        .getString(context, home_page_navigation_expired),
                  ),
                ],
                onTap: (index) {
                  scheduleIndex = index;
                },
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  !(state.activeRidesAsDriver.isEmpty &&
                          state.activeRidesAsPassenger.isEmpty)
                      ? SingleChildScrollView(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  StringsManager.instance.getString(context,
                                      home_page_navigation_schedule_quote_one),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  StringsManager.instance.getString(context,
                                      home_page_navigation_schedule_quote_two),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(height: 10),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount:
                                        state.activeRidesAsDriver.length +
                                            state.activeRidesAsPassenger.length,
                                    itemBuilder: (context, index) {
                                      if (index <
                                          state.activeRidesAsDriver.length) {
                                        return _buildScheduleActiveDriverCard(
                                            context: context,
                                            ride: state
                                                .activeRidesAsDriver[index],
                                            index: index,
                                            cubit: cubit);
                                      } else {
                                        final passengerIndex = index -
                                            state.activeRidesAsDriver.length;
                                        final rideEntry = state
                                            .activeRidesAsPassenger.entries
                                            .elementAt(passengerIndex);

                                        final ride = rideEntry.key;
                                        final numPass = rideEntry.value;

                                        return _buildScheduleActivePassengerCard(
                                          context: context,
                                          ride: ride,
                                          index: index,
                                          numPass: numPass,
                                          cubit: cubit,
                                        );
                                      }
                                    },
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    cubit.fetchSchedule(
                                        userId:
                                            AuthMiddleware.getUserId(context)!,
                                        isLoadMore: true);
                                  },
                                  icon: Icon(Icons.add),
                                  color: Colors.blueAccent,
                                ),
                                const SizedBox(height: 230),
                              ],
                            ),
                          ),
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(StringsManager.instance.getString(context,
                                  home_page_navigation_no_active_rides_one)),
                              Text(
                                StringsManager.instance.getString(context,
                                    home_page_navigation_no_active_rides_two),
                              ),
                            ],
                          ),
                        ),
                  !(state.waitingRidesAsDriver.isEmpty &&
                          state.waitingRidesAsPassenger.isEmpty)
                      ? SingleChildScrollView(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  StringsManager.instance.getString(context,
                                      home_page_navigation_schedule_quote_one_expired),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  StringsManager.instance.getString(context,
                                      home_page_navigation_schedule_quote_two_expired),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(height: 10),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: state
                                            .waitingRidesAsDriver.length +
                                        state.waitingRidesAsPassenger.length,
                                    itemBuilder: (context, index) {
                                      if (index <
                                          state.waitingRidesAsDriver.length) {
                                        return _buildScheduleWaitingDriverCard(
                                            context: context,
                                            ride: state
                                                .waitingRidesAsDriver[index],
                                            index: index,
                                            cubit: cubit);
                                      } else {
                                        final passengerIndex = index -
                                            state.waitingRidesAsDriver.length;
                                        final rideEntry = state
                                            .waitingRidesAsPassenger.entries
                                            .elementAt(passengerIndex);

                                        final ride = rideEntry.key;
                                        final numPass = rideEntry.value;

                                        return _buildScheduleExpiredPassengerCard(
                                          context: context,
                                          ride: ride,
                                          index: index,
                                          numPass: numPass,
                                          cubit: cubit,
                                        );
                                      }
                                    },
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    cubit.fetchSchedule(
                                        userId:
                                            AuthMiddleware.getUserId(context)!,
                                        isLoadMore: true);
                                  },
                                  icon: Icon(Icons.add),
                                  color: Colors.blueAccent,
                                ),
                                const SizedBox(height: 230),
                              ],
                            ),
                          ),
                        )
                      : Center(
                          child: Text(StringsManager.instance.getString(
                              context, home_page_navigation_no_expired_rides)),
                        ),
                  !(state.expiredRidesAsDriver.isEmpty &&
                          state.expiredRidesAsPassenger.isEmpty)
                      ? SingleChildScrollView(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  StringsManager.instance.getString(context,
                                      home_page_navigation_schedule_quote_one_expired),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  StringsManager.instance.getString(context,
                                      home_page_navigation_schedule_quote_two_expired),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(height: 10),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: state
                                            .expiredRidesAsDriver.length +
                                        state.expiredRidesAsPassenger.length,
                                    itemBuilder: (context, index) {
                                      if (index <
                                          state.expiredRidesAsDriver.length) {
                                        return _buildScheduleExpiredDriverCard(
                                            context: context,
                                            ride: state
                                                .expiredRidesAsDriver[index],
                                            index: index,
                                            cubit: cubit);
                                      } else {
                                        final passengerIndex = index -
                                            state.expiredRidesAsDriver.length;
                                        final rideEntry = state
                                            .expiredRidesAsPassenger.entries
                                            .elementAt(passengerIndex);

                                        final ride = rideEntry.key;
                                        final numPass = rideEntry.value;

                                        return _buildScheduleExpiredPassengerCard(
                                          context: context,
                                          ride: ride,
                                          index: index,
                                          numPass: numPass,
                                          cubit: cubit,
                                        );
                                      }
                                    },
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    cubit.fetchSchedule(
                                        userId:
                                            AuthMiddleware.getUserId(context)!,
                                        isLoadMore: true);
                                  },
                                  icon: Icon(Icons.add),
                                  color: Colors.blueAccent,
                                ),
                                const SizedBox(height: 230),
                              ],
                            ),
                          ),
                        )
                      : Center(
                          child: Text(StringsManager.instance.getString(
                              context, home_page_navigation_no_expired_rides)),
                        ),
                ],
              ),
            ),
          ],
        ),
      );
    } else if (state is HomePageNavigationErrorState) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            StringsManager.instance.getString(context, state.message),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      );
    }
    return Container();
  } */



  Widget _buildMetricsTab({
    required BuildContext context,
    required HomePageNavigationState state,
    required HomePageNavigationLogic cubit,
  }) {
    return FutureBuilder<Widget?>(
      future: _buildMetricsTabContent(context, state, cubit),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
              child: Text(
                '${StringsManager.instance.getString(context, chat_page_error)} ${snapshot.error}',
              ));
        } else {
          return snapshot.data ?? SizedBox();
        }
      },
    );
  }

  Future<Widget?> _buildMetricsTabContent(
      BuildContext context,
      HomePageNavigationState state,
      HomePageNavigationLogic cubit,
      ) async {
    if (state is HomePageNavigationMetricsLoadedState) {
      List<Ride> userRides = state.rides;

      double fuelSaved = MetricsHelper.calculateTotalFuelSaved(userRides);
      double totalKm = MetricsHelper.calculateTotalKm(userRides);
      double co2Saved = fuelSaved * 2.3;
      bool isDarkMode = widget.isDarkMode;
      Widget co2Card = MetricsHelper.buildMetricsCard(
          context: context,
          co2: co2Saved.toStringAsFixed(1),
          fuel: fuelSaved.toStringAsFixed(1),
          distance: totalKm.toStringAsFixed(1),
          numRides: userRides.length.toStringAsFixed(0), isDarkMode: true);

      Widget comparisonChart = MetricsHelper.buildMetricsComparisonChart(userRides, context);
      Widget timePlot = TotalDistanceGraph(userRides: userRides);

      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              StringsManager.instance
                  .getString(context, home_page_navigation_metrics_quote_one),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Text(
              StringsManager.instance
                  .getString(context, home_page_navigation_metrics_quote_two),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            co2Card,
            const SizedBox(
              height: 20,
            ),
            Text(
              StringsManager.instance
                  .getString(context, metrics_page_accumulated_usage),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(child: timePlot),
            comparisonChart,
          ],
        ),
      );
    } else if (state is HomePageNavigationErrorState) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            StringsManager.instance.getString(context, state.message),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomePageNavigationLogic>();

    return BlocBuilder<HomePageNavigationLogic, HomePageNavigationState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CarpoolAppBar(
              title: StringsManager.instance.getString(context, app_title),
              isDarkMode: widget.isDarkMode,
              onNotificationTap: () => {
                if (!AuthMiddleware.isLoggedIn(context))
                  {AuthMiddleware.navigateIfLoggedIn(context)}
                else
                  {
                    Navigator.pushNamed(
                      context,
                      NotificationPage.routeName,
                    ),
                  }
              },
              onSettingsTap: () {
                if (!AuthMiddleware.isLoggedIn(context)) {
                  AuthMiddleware.navigateIfLoggedIn(context);
                } else {
                  Navigator.pushNamed(context, SettingsPage.routeName);
                }
              },
              notificationStream: AuthMiddleware.isLoggedIn(context)
                  ? cubit.getNotifications(id: AuthMiddleware.getUserId(context)!)
                  : null,
            ),
            bottomNavigationBar: NavigationBar(
              onDestinationSelected: (int index) {
                setState(() {
                  if (((index != 0) && !AuthMiddleware.isLoggedIn(context))) {
                    AuthMiddleware.navigateIfLoggedIn(context);
                  } else if (index == 1 && AuthMiddleware.isLoggedIn(context)) {
                    cubit.fetchUserCars(userId: AuthMiddleware.getUserId(context)!);
                    _selectedIndex = index;
                  } else if (index == 3 && AuthMiddleware.isLoggedIn(context)) {
                    cubit.fetchSchedule(userId: AuthMiddleware.getUserId(context)!);
                    _selectedIndex = index;
                  } else if (index == 4 && AuthMiddleware.isLoggedIn(context)) {
                    cubit.fetchMetrics(userId: AuthMiddleware.getUserId(context)!);
                    _selectedIndex = index;
                  } else {
                    _selectedIndex = index;
                  }
                });
              },
              indicatorColor:
              widget.isDarkMode ? AppColors.fourthColor : AppColors.firstColor,
              backgroundColor:
              widget.isDarkMode ? AppColors.fifthColor : AppColors.thirdColor,
              selectedIndex: _selectedIndex,
              destinations: <Widget>[
                NavigationDestination(
                  icon: Icon(
                    Icons.search,
                    color: _selectedIndex == 0
                        ? (widget.isDarkMode
                        ? AppColors.tenthColor
                        : AppColors.textColor)
                        : (widget.isDarkMode
                        ? AppColors.ninthColor
                        : AppColors.fifthColor),
                  ),
                  label: StringsManager.instance
                      .getString(context, home_page_search_label),
                ),
                Stack(
                  children: [
                    NavigationDestination(
                      icon: Icon(
                        Icons.add,
                        color: _selectedIndex == 1
                            ? (widget.isDarkMode
                            ? AppColors.tenthColor
                            : AppColors.textColor)
                            : (widget.isDarkMode
                            ? AppColors.ninthColor
                            : AppColors.fifthColor),
                      ),
                      label: StringsManager.instance
                          .getString(context, home_page_publish_label),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    NavigationDestination(
                      icon: Icon(
                        Icons.message,
                        color: _selectedIndex == 2
                            ? (widget.isDarkMode
                            ? AppColors.tenthColor
                            : AppColors.textColor)
                            : (widget.isDarkMode
                            ? AppColors.ninthColor
                            : AppColors.fifthColor),
                      ),
                      label: StringsManager.instance
                          .getString(context, home_page_messages_label),
                    ),
                    if (AuthMiddleware.isLoggedIn(context))
                      Positioned(
                        right: 0,
                        top: 0,
                        child: StreamBuilder<Map<String, int>>(
                          stream: cubit.loadChatsSub(
                              id: AuthMiddleware.getUserId(context)!),
                          initialData: const {},
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              Map<String, int> unreadMessages = snapshot.data!;
                              int totalUnreadCount = 0;
                              unreadMessages.values.forEach((count) {
                                totalUnreadCount += count;
                              });
                              if (totalUnreadCount > 0) {
                                return Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    totalUnreadCount.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              }
                            }
                            return Container();
                          },
                        ),
                      ),
                  ],
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.calendar_month,
                    color: _selectedIndex == 3
                        ? (widget.isDarkMode
                        ? AppColors.tenthColor
                        : AppColors.textColor)
                        : (widget.isDarkMode
                        ? AppColors.ninthColor
                        : AppColors.fifthColor),
                  ),
                  label: StringsManager.instance
                      .getString(context, home_page_schedule_label),
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.eco,
                    color: _selectedIndex == 4
                        ? (widget.isDarkMode
                        ? AppColors.tenthColor
                        : AppColors.textColor)
                        : (widget.isDarkMode
                        ? AppColors.ninthColor
                        : AppColors.fifthColor),
                  ),
                  label: StringsManager.instance
                      .getString(context, home_page_metrics_label),
                ),
              ],
            ),
            body: IndexedStack(
              index: _selectedIndex,
              children: [
                // Search Page Tab
                _buildSearchTab(context: context, state: state, cubit: cubit),

                // Add Page Tab
                _buildPublishTab(context: context, state: state, cubit: cubit),

                // Message Page Tab
                _buildMessageTab(context: context, state: state, cubit: cubit),

                // Schedule Page Tab
                _buildScheduleTab(context: context, state: state, cubit: cubit),

                // Metrics Page Tab
                _buildMetricsTab(context: context, state: state, cubit: cubit)
              ],
            ),
          );
        });
  }
}

class ChatItem extends StatefulWidget {
  final dynamic data;
  final int unreadMessages;
  final int index;
  final bool isDarkMode;
  final bool pt;

  const ChatItem({
    required this.data,
    required this.index,
    required this.unreadMessages,
    required this.isDarkMode,
    required this.pt,
  });

  @override
  _ChatItemState createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(minutes: 1), (Timer t) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data != null) {
      String otherName = widget.data["otherName"];
      String formattedName = otherName.substring(0, 1).toUpperCase() +
          otherName.substring(1).toLowerCase();
      String message = widget.data["message"];
      int timestamp = widget.data["timestamp"];

      Color titleColor = widget.isDarkMode
          ? widget.index % 2 == 0
          ? AppColors.tenthColor
          : Colors.white
          : widget.index % 2 == 0
          ? AppColors.ninthColor
          : AppColors.ninthColor;

      Color text = widget.isDarkMode
          ? widget.index % 2 == 0
          ? AppColors.ninthColor
          : AppColors.firstColor
          : widget.index % 2 == 0
          ? AppColors.eighthColor
          : AppColors.eighthColor;

      Color background = widget.isDarkMode
          ? widget.index % 2 == 0
          ? AppColors.fifthColor
          : AppColors.eighthColor
          : widget.index % 2 == 0
          ? AppColors.firstColor
          : AppColors.secondColor;

      Color messageColor = widget.isDarkMode
          ? widget.index % 2 == 0
          ? AppColors.ninthColor
          : AppColors.firstColor
          : widget.index % 2 == 0
          ? AppColors.tenthColor
          : AppColors.tenthColor;

      Color timeColor = widget.isDarkMode ? AppColors.secondColor : Colors.grey;

      Duration difference = Timestamp.now()
          .toDate()
          .difference(DateTime.fromMillisecondsSinceEpoch(timestamp));
      String timeAgo = _formatTimeAgo(difference, widget.pt);

      if (message.length > 50) {
        message = "${message.substring(0, 50)}...";
      }

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: AppColors.tenthColor.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () async {
              MyUser? user = await AuthMiddleware.getUser(
                  AuthMiddleware.getUserId(context)!);
              Navigator.pushNamed(
                context,
                ChatPage.routeName,
                arguments: ContactDriver(
                  senderId: user!.id,
                  senderName: user.name,
                  receiverName: otherName,
                  receiverId: widget.data["otherId"],
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: background,
              elevation: 0,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    child: Icon(
                      Icons.account_circle,
                      color: text,
                      size: 40,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formattedName,
                          style: TextStyle(
                            color: titleColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6.0),
                          child: Text(
                            message,
                            style: TextStyle(
                              color: messageColor,
                              fontSize: 18,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        timeAgo,
                        style: TextStyle(
                          color: timeColor,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        widget.unreadMessages.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: (widget.unreadMessages > 0)
                                ? titleColor
                                : background),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  String _formatTimeAgo(Duration difference, bool pt) {
    if (difference.inSeconds < 60) {
      if (pt) {
        return "Agora";
      }
      return "Just now";
    } else if (difference.inMinutes < 60) {
      if (pt) {
        return "${difference.inMinutes} min atrás";
      }
      return "${difference.inMinutes} min ago";
    } else if (difference.inHours < 24) {
      if (pt) {
        return "${difference.inHours} hora${difference.inHours > 1 ? "s" : ""} atrás";
      }
      return "${difference.inHours} hour${difference.inHours > 1 ? "s" : ""} ago";
    } else if (difference.inDays < 30) {
      if (pt) {
        return "${difference.inDays} dia${difference.inDays > 1 ? "s" : ""} atrás";
      }
      return "${difference.inDays} day${difference.inDays > 1 ? "s" : ""} ago";
    } else {
      DateTime dateTime = DateTime.now().subtract(difference);
      return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    }
  }
}

class Passenger {
  final MyUser myUser;
  final int count;

  Passenger({
    required this.myUser,
    required this.count,
  });
}

void _showModalBottomSheet(BuildContext context, List<Passenger> passengers,
    HomePageNavigationLogic logic, Ride ride) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return _MyModalBottomSheetContent(
        passengers: passengers,
        logic: logic,
        ride: ride,
      );
    },
  );
}

class _MyModalBottomSheetContent extends StatefulWidget {
  final List<Passenger> passengers;
  final HomePageNavigationLogic logic;
  final Ride ride;

  _MyModalBottomSheetContent(
      {required this.passengers, required this.logic, required this.ride});

  @override
  _MyModalBottomSheetContentState createState() =>
      _MyModalBottomSheetContentState();
}

class _MyModalBottomSheetContentState
    extends State<_MyModalBottomSheetContent> {
  late List<int> _rating;

  @override
  void initState() {
    super.initState();
    _rating = List.filled(widget.passengers.length, 0);
  }

  Widget _buildRatingRow(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
                '${StringsManager.instance.getString(context, home_page_navigation_rate)}${widget.passengers[index].myUser.name}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400)),
            SizedBox(width: 10),
            Row(
              children: List.generate(
                5,
                    (starIndex) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _rating[index] = starIndex + 1;
                      });
                    },
                    child: Icon(
                      starIndex < _rating[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: starIndex < _rating[index]
                          ? Colors.yellow
                          : Colors.grey,
                    ),
                  );
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.add_reaction_outlined),
              onPressed: () async {
                if (await widget.logic.addRatingToPassenger(
                    userId: AuthMiddleware.getUserId(context)!,
                    passengerId: widget.passengers[index].myUser.id,
                    rating: _rating[index],
                    rideId: widget.ride.id,
                    date: widget.ride.date,
                    hour: widget.ride.hour,
                    from: widget.ride.startingPoint,
                    to: widget.ride.destination)) {
                  _showSnackBarSuccess(
                      context,
                      StringsManager.instance.getString(context,
                          home_page_navigation_passenger_rated_successfuly));
                } else {
                  _showSnackBarError(
                      context,
                      StringsManager.instance.getString(context,
                          home_page_navigation_error_rating_passenger));
                }
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          widget.passengers.length,
              (index) => _buildRatingRow(index),
        ),
      ),
    );
  }
}

void _showSnackBarSuccess(BuildContext context, String message) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(
      message: message,
      backgroundColor: AppColors.eighthColor,
    ),
  );
}

void _showSnackBarError(BuildContext context, String message) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.error(
      message: message,
      backgroundColor: AppColors.sixthColor,
    ),
  );
}

class TotalDistanceGraph extends StatelessWidget {
  final List<Ride> userRides;

  const TotalDistanceGraph({Key? key, required this.userRides})
      : super(key: key);

  double extractNumericValue(String distanceString) {
    List<String> parts = distanceString.split(' ');
    if (parts.length == 2) {
      String distanceValue = parts[0];
      try {
        return double.parse(distanceValue);
      } catch (e) {
        print('Error parsing distance to double: $e');
        return 0;
      }
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width - 20;
    double chartHeight = 300;

    DateTime firstRideDate = DateTime.parse(userRides.first.date);
    DateTime lastRideDate = DateTime.parse(userRides.last.date);

    bool showFullDate = (lastRideDate.difference(firstRideDate).inDays <= 30);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: screenWidth,
        height: chartHeight,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            titlesData: FlTitlesData(
              leftTitles: SideTitles(
                showTitles: true,
                interval: calculateYInterval(userRides),
              ),
              bottomTitles: SideTitles(
                showTitles: true,
                margin: 8,
                rotateAngle: -45,
                getTitles: (value) {
                  DateTime date =
                  DateTime.fromMillisecondsSinceEpoch(value.toInt());
                  if (showFullDate) {
                    // Show full date (Month Day)
                    return DateFormat('MMM dd').format(date);
                  } else {
                    // Show month/year
                    return DateFormat('MMM\nyyyy').format(date);
                  }
                },
              ),
            ),
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            barGroups: _calculateBarGroups(userRides),
          ),
        ),
      ),
    );
  }

  double calculateYInterval(List<Ride> rides) {
    double maxDistance = rides
        .map((ride) => extractNumericValue(ride.distance))
        .reduce((a, b) => a + b);
    double interval = (maxDistance / 10).ceilToDouble();
    return interval;
  }

  List<BarChartGroupData> _calculateBarGroups(List<Ride> rides) {
    List<BarChartGroupData> barGroups = [];
    double accumulatedDistance = 0;
    final formatter = NumberFormat("0.0");

    for (int i = 0; i < rides.length; i++) {
      Ride ride = rides[i];
      DateTime rideDate = DateTime.parse(ride.date);
      double rideDistance = extractNumericValue(ride.distance);
      accumulatedDistance += rideDistance;
      barGroups.add(
        BarChartGroupData(
          x: rideDate.millisecondsSinceEpoch.toInt(),
          barRods: [
            BarChartRodData(
              y: double.parse(formatter.format(accumulatedDistance)),
              colors: [Colors.blue],
            ),
          ],
        ),
      );
    }

    return barGroups;
  }
}
class MetricsHelper{
  static List<BarChartGroupData> buildBarGroups(
      List<double> lastWeek, List<double> thisWeek) {
    final formatter = NumberFormat("0.0");

    List<double> formattedLastWeek = lastWeek.map((value) => double.parse(formatter.format(value))).toList();
    List<double> formattedThisWeek = thisWeek.map((value) => double.parse(formatter.format(value))).toList();

    return List.generate(
      7,
          (index) => BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            y: formattedLastWeek[index],
            colors: [AppColors.fifthColor],
          ),
          BarChartRodData(
            y: formattedThisWeek[index],
            colors: [AppColors.secondColor],
          ),
        ],
      ),
    );
  }

  static double _calculateMaxY(List<double> lastWeek, List<double> thisWeek) {
    double max1 = lastWeek.reduce((value, element) => value > element ? value : element);
    double max2 = thisWeek.reduce((value, element) => value > element ? value : element);

    double max = max1 > max2 ? max1 : max2;

    if (max <= 1.0) {
      return 1.0;
    } else if (max <= 2.0) {
      return 2.0;
    } else if (max <= 5.0) {
      return 5.0;
    } else {
      return ((max / 5).ceil() * 5).toDouble();
    }
  }


  static Widget buildMetricsCard({
    required BuildContext context,
    required String distance,
    required String numRides,
    required String fuel,
    required String co2,
    required bool isDarkMode,
  }) {
    Color background =
    isDarkMode ? AppColors.seventhColor : AppColors.secondColor;
    Color textColor =
    isDarkMode ? AppColors.secondColor : AppColors.seventhColor;
    return Card(
      color: background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringsManager.instance
                      .getString(context, metrics_page_total_rides),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: textColor,
                  ),
                ),
                Text(
                  " $numRides",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringsManager.instance
                      .getString(context, metrics_page_total_distance),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: textColor,
                  ),
                ),
                Text(
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                  " $distance km",
                ),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringsManager.instance
                      .getString(context, metrics_page_CO2_saved),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: textColor,
                  ),
                ),
                Text(
                  " $co2 kg/m³",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringsManager.instance
                      .getString(context, metrics_page_fuel_saved),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: textColor,
                  ),
                ),
                Text(
                  " $fuel l",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildMetricsComparisonChart(List<Ride> userRides, BuildContext context) {
    List<List<double>> weekLists = buildWeekLists(userRides);
    List<double> lastWeek = weekLists[0];
    List<double> thisWeek = weekLists[1];

    double maxY = _calculateMaxY(lastWeek, thisWeek);
    double interval;

    if (maxY < 5) {
      interval = 0.5;
    } else if (maxY < 10) {
      interval = 1;
    } else {
      interval = (maxY / 10).ceilToDouble();
    }


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Text(
            StringsManager.instance
                .getString(context, metrics_page_graph_description),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MetricsHelper.buildLegend(
                  StringsManager.instance.getString(
                      context, metrics_page_graph_subtitle_last_week),
                  AppColors.fifthColor),
              const SizedBox(width: 20),
              MetricsHelper.buildLegend(
                  StringsManager.instance.getString(
                      context, metrics_page_graph_subtitle_this_week),
                  AppColors.secondColor),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: 300,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: maxY,
                minY: 0,
                groupsSpace: 12,
                barGroups: buildBarGroups(lastWeek, thisWeek),
                titlesData: FlTitlesData(
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) => TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    margin: 16,
                    getTitles: (double value) {
                      switch (value.toInt()) {
                        case 0:
                          return StringsManager.instance
                              .getString(context, metrics_page_graph_day_mon);
                        case 1:
                          return StringsManager.instance
                              .getString(context, metrics_page_graph_day_tue);
                        case 2:
                          return StringsManager.instance
                              .getString(context, metrics_page_graph_day_wed);
                        case 3:
                          return StringsManager.instance
                              .getString(context, metrics_page_graph_day_thu);
                        case 4:
                          return StringsManager.instance
                              .getString(context, metrics_page_graph_day_fri);
                        case 5:
                          return StringsManager.instance
                              .getString(context, metrics_page_graph_day_sat);
                        case 6:
                          return StringsManager.instance
                              .getString(context, metrics_page_graph_day_sun);
                        default:
                          return '';
                      }
                    },
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) => const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    interval:
                    interval,
                  ),
                ),
                borderData: FlBorderData(show: false),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildLegend(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  static DateTime convertToDate(String input) {
    var format = DateFormat('yyyy-MM-dd');
    return format.parse(input);
  }

  static int getWeekdayNumber(DateTime date) {
    return date.weekday - 1 == -1 ? 6 : date.weekday - 1;
  }

  static List<List<double>> buildWeekLists(List<Ride> rides) {
    List<double> lastWeek = List.filled(7, 0);
    List<double> thisWeek = List.filled(7, 0);

    DateTime now = DateTime.now();

    DateTime startOfThisWeek = now.subtract(Duration(days: now.weekday - 1));

    rides.forEach((ride) {
      DateTime rideDate = convertToDate(ride.date);
      int weekdayNumber = getWeekdayNumber(rideDate);
      double kilometers = extractNumericValue(ride.distance);
      double fuelSaved = (kilometers * ride.car!.consumption) / 100;
      double co2Saved = fuelSaved * 2.3;

      if (rideDate.isBefore(startOfThisWeek)) {
        lastWeek[weekdayNumber] += co2Saved;
      } else {
        thisWeek[weekdayNumber] += co2Saved;
      }
    });

    return [lastWeek, thisWeek];
  }

  static double extractNumericValue(String distanceString) {
    List<String> parts = distanceString.split(' ');
    if (parts.length == 2) {
      String distanceValue = parts[0];
      try {
        return double.parse(distanceValue);
      } catch (e) {
        print('Erro ao converter a distância para double: $e');
        return 0;
      }
    } else {
      return 0;
    }
  }

  static double calculateTotalFuelSaved(List<Ride> rides) {
    double totalFuel = 0;
    rides.forEach((ride) {
      double distance = extractNumericValue(ride.distance);
      totalFuel += ride.car!.consumption * distance;
    });
    return totalFuel / 100;
  }

  static double calculateTotalKm(List<Ride> rides) {
    double total = 0;
    rides.forEach((ride) {
      double distance = extractNumericValue(ride.distance);
      total += distance;
    });
    return total;
  }

  static double calculateTotalDistance(List<Ride> userRides) {
    double totalDistance = 0;
    userRides.forEach((ride) {
      totalDistance += double.parse(ride.distance.split(' ')[0]);
    });
    return totalDistance;
  }
}