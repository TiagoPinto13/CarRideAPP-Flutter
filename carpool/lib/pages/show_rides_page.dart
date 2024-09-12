import 'package:carpool/datamodel/ride.dart';
import 'package:carpool/datamodel/search_input.dart';
import 'package:carpool/log_in/auth_middleware.dart';
import 'package:carpool/pages/show_rides_page/show_rides_page_logic.dart';
import 'package:carpool/theme/app_colors.dart';
import 'package:carpool/utils/strings/managers/strings_managers.dart';
import 'package:carpool/utils/strings/strings_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../datamodel/car.dart';
import '../datamodel/user.dart';
import '../theme/app_style.dart';
import 'chat_page.dart';

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

class ShowRidesPage extends StatefulWidget {
  static const routeName = '/showRidesPage';
  final SearchInput searchInput;
  final bool isDarkMode;
  const ShowRidesPage(
      {super.key, required this.searchInput, required this.isDarkMode});

  @override
  State<ShowRidesPage> createState() => _ShowRidesPageState();
}

class _ShowRidesPageState extends State<ShowRidesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowRidesPageLogic(isDarkMode: widget.isDarkMode),
      child: _BuildRidesPage(
        searchInput: widget.searchInput,
        isDarkMode: widget.isDarkMode,
      ),
    );
  }
}

class _BuildRidesPage extends StatefulWidget {
  final SearchInput searchInput;
  final bool isDarkMode;

  const _BuildRidesPage({required this.searchInput, required this.isDarkMode});

  @override
  _BuildRidesPageState createState() => _BuildRidesPageState();
}

class _BuildRidesPageState extends State<_BuildRidesPage> {
  late ShowRidesPageLogic _logic;

  @override
  void initState() {
    super.initState();
    _logic = context.read<ShowRidesPageLogic>();
    String date = DateFormat('yyyy-MM-dd').format(widget.searchInput.date!);
    String? userId = AuthMiddleware.getUserId(context);
    int numPass = widget.searchInput.passengers;
    double fromLat = widget.searchInput.fromLat;
    double fromLng = widget.searchInput.fromLng;
    double? toLat = widget.searchInput.toLat;
    double? toLng = widget.searchInput.toLng;
    bool disability = widget.searchInput.disability;

    _logic.fetchRides(
      userId: userId!,
      date: date,
      numPassengers: numPass,
      fromLat: fromLat,
      fromLng: fromLng,
      toLat: toLat,
      toLng: toLng,
      disability: disability,
    );

  }

  Widget _buildCard(BuildContext context, Ride ride, int index) {
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

    int availableSeats = ride.maxPassengers;
    ride.passengers.forEach((key, value) {
      availableSeats -= value as int;
    });

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
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: ride.driver.name[0].toUpperCase() +
                                    ride.driver.name.substring(1).toLowerCase(),
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: priceColor,
                                ),
                              ),
                              if (ride.driver.ratingAsDriver != null &&
                                  ride.driver.ratingAsDriver! > 0)
                                TextSpan(
                                  text:
                                      "  ${ride.driver.ratingAsDriver!.toStringAsFixed(1)}/5.0",
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
                        if (ride.driver.ratingAsDriver != null &&
                            ride.driver.ratingAsDriver! > 0)
                          const Icon(
                            Icons.star_outlined,
                            color: Colors.yellow,
                          ),
                      ],
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
                    "${StringsManager.instance.getString(context, home_page_navigation_available_seats)} $availableSeats"),
                Text(disable ? StringsManager.instance.getString(context, home_page_navigation_available_disable_friendly) : ''),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
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
                              receiverName: ride.driver.name,
                              receiverId: ride.driver.id,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: contactButtonColor),
                        child: Text(
                          StringsManager.instance.getString(
                              context, show_rides_page_contact_driver),
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
                          if (await _logic.sendJoinRideNotification(
                            driver: ride.driver.id,
                            ride: ride,
                            text: AuthMiddleware.getUserId(context)!,
                            numPass: widget.searchInput.passengers,
                          )) {
                            _showSnackBarSuccess(
                              context,
                              StringsManager.instance.getString(context, show_rides_page_request_sent_to_driver),
                            );

                            Navigator.pop(context);
                          } else {
                            _showSnackBarError(
                              context,
                             StringsManager.instance.getString(context, show_rides_page_failed_to_send_request_to_driver),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: joinButtonColor),
                        child: Text(
                          StringsManager.instance
                              .getString(context, show_rides_page_join_ride),
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

  Widget _buildBody({
    required BuildContext context,
    required ShowRidesPageState state,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (state is ShowRidesPageLoadedState)
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                top: 8,
              ),
              child: Text(
                DateFormat('dd/MM/yyyy').format(widget.searchInput.date!),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          Expanded(
            child: _buildListView(context, state),
          ),
        ],
      ),
    );
  }

  Widget _buildListView(BuildContext context, ShowRidesPageState state) {
    if (state is ShowRidesPageLoadedState) {
      return ListView.builder(
        itemCount: state.rides.length,
        itemBuilder: (context, index) {
          return _buildCard(context, state.rides[index], index);
        },
      );
    } else if (state is ShowRidesPageLoadingState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is ShowRidesPageErrorState) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            StringsManager.instance.getString(context, state.message),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      );
    } else {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            StringsManager.instance
                .getString(context, show_rides_page_error_msg),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowRidesPageLogic, ShowRidesPageState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor:
                widget.isDarkMode ? AppColors.tenthColor : AppColors.fifthColor,
            centerTitle: true,
            title: Text(
                StringsManager.instance
                    .getString(context, show_rides_page_title),
                style: widget.isDarkMode ? AppStyle.h1Dark : AppStyle.h1Light),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: widget.isDarkMode ? Colors.white : AppColors.tenthColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: _buildBody(context: context, state: state),
          ),
        );
      },
    );
  }
}
