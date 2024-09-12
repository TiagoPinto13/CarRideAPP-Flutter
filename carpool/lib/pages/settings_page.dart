import 'package:carpool/log_in/auth_middleware.dart';
import 'package:carpool/network/user_repository.dart';
import 'package:carpool/pages/home_page_navigation.dart';
import 'package:carpool/pages/initial_page.dart';
import 'package:carpool/pages/settings_page/settings_page_logic.dart';
import 'package:carpool/providers/preferences.dart';
import 'package:carpool/theme/app_colors.dart';
import 'package:carpool/ui/app_button.dart';
import 'package:carpool/utils/strings/managers/strings_managers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../datamodel/user.dart';
import '../theme/app_style.dart';
import '../utils/strings/strings_constants.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settingsPage';
  final bool isDarkMode;

  const SettingsPage({Key? key, required this.isDarkMode}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class IconWidget extends StatelessWidget {
  final IconData icon;
  final Color color;

  const IconWidget({
    super.key,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsPageLogic(isDarkMode: widget.isDarkMode),
      child: _BuildSettingsPage(isDarkMode: widget.isDarkMode),
    );
  }
}

class _BuildSettingsPage extends StatefulWidget {
  final bool isDarkMode;
  const _BuildSettingsPage({required this.isDarkMode});

  @override
  _BuildSettingsPageState createState() => _BuildSettingsPageState();
}

class _BuildSettingsPageState extends State<_BuildSettingsPage> {
  late SettingsPageLogic _logic;
  late int _currentLanguage;
  int _currentCar = 0;
  final UserRepository _userRepository = UserRepository();

  @override
  void initState() {
    super.initState();
    _logic = context.read<SettingsPageLogic>();
  }

  Widget buildProfileCard(BuildContext context) {
    return FutureBuilder<MyUser?>(
      future: AuthMiddleware.getUser(AuthMiddleware.getUserId(context)!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text(
              '${StringsManager.instance.getString(context, settings_page_error)}${snapshot.error}');
        } else {
          final user = snapshot.data!;
          return FutureBuilder<MapEntry<double, int>>(
              future: _userRepository.fetchDriverRating(userId: user.id),
              builder: (context, driverRatingSnapshot) {
                if (driverRatingSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                final driverRating = driverRatingSnapshot.data?.key ?? 0;
                final numDriverRating = driverRatingSnapshot.data?.value ?? 0;

                return FutureBuilder<MapEntry<double, int>>(
                    future:
                        _userRepository.fetchPassengerRating(userId: user.id),
                    builder: (context, passengerRatingSnapshot) {
                      if (passengerRatingSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      final passengerRating =
                          passengerRatingSnapshot.data?.key ?? 0;
                      final numPassengerRating =
                          passengerRatingSnapshot.data?.value ?? 0;

                      return Card(
                        color: AppColors.firstColor,
                        child: SizedBox(
                          height: 150,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        user.name[0].toUpperCase() +
                                            user.name
                                                .substring(1)
                                                .toLowerCase(),
                                        style: const TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 6.0),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        user.email,
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    if (driverRating > 0)
                                      const SizedBox(height: 10),
                                    if (driverRating > 0)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 4.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            SizedBox(width: 5),
                                            Expanded(
                                              child: RichText(
                                                text: TextSpan(
                                                  style:
                                                      DefaultTextStyle.of(context)
                                                          .style,
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: StringsManager.instance.getString(context, settings_page_rating_as_driver),
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          color: Colors.black),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "${driverRating.toStringAsFixed(1)}/5.0 ",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.black),
                                                    ),
                                                    TextSpan(
                                                      text: "($numDriverRating)",
                                                      style: TextStyle(
                                                          fontSize: 13.0,
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (passengerRating > 0)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 4.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            SizedBox(width: 5),
                                            RichText(
                                              text: TextSpan(
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text:
                                                        StringsManager.instance.getString(context, settings_page_rating_as_passenger),
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        color: Colors.black),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        "${passengerRating.toStringAsFixed(1)}/5.0 ",
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        "($numPassengerRating)",
                                                    style: TextStyle(
                                                        fontSize: 13.0,
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              });
        }
      },
    );
  }

  Widget buildLogout({required BuildContext context}) {
    return GestureDetector(
      child: SizedBox(
        height: 60,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 4, right: 4.0),
            child: Row(
              children: [
                const IconWidget(icon: Icons.logout, color: Colors.black),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  StringsManager.instance
                      .getString(context, settings_page_logout),
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () async => {
        AuthMiddleware.logout(context),
        Navigator.pushNamed(context, InitialPage.routeName),
      },
    );
  }

  Widget buildLanguage() {
    _currentLanguage = PreferencesService.isPt() ? 2 : 1;
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.only(left: 4.0, right: 4),
          child: Row(
            children: [
              const IconWidget(icon: Icons.book, color: AppColors.eighthColor),
              const SizedBox(
                width: 15,
              ),
              Text(
                StringsManager.instance
                    .getString(context, settings_page_language),
                style: TextStyle(fontSize: 18),
              ),
              const Expanded(child: SizedBox()),
              DropdownButton<int>(
                value: _currentLanguage,
                onChanged: (int? language) async {
                  await _logic.changeLanguage(
                      language: PreferencesService.isPt() ? "en" : "pt");
                },
                items: [
                  DropdownMenuItem<int>(
                    value: 1,
                    child: Text(
                      StringsManager.instance
                          .getString(context, settings_page_english),
                    ),
                  ),
                  DropdownMenuItem<int>(
                    value: 2,
                    child: Text(
                      StringsManager.instance
                          .getString(context, settings_page_portuguse),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDarkMode() {
    bool dark = PreferencesService.isDarkMode();
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4),
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const IconWidget(
                  icon: Icons.dark_mode, color: AppColors.eighthColor),
              const SizedBox(
                width: 15,
              ),
              Text(
                StringsManager.instance
                    .getString(context, settings_page_change_dark_mode),
                style: TextStyle(fontSize: 18),
              ),
              const Expanded(child: SizedBox()),
              Switch(
                value: dark,
                onChanged: (value) async {
                  await _logic.changeTheme(
                      theme:
                          PreferencesService.isDarkMode() ? "light" : "dark");
                  Navigator.pushNamed(context, SettingsPage.routeName);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAddCars() {
    return GestureDetector(
      child: SizedBox(
        height: 60,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4),
            child: Row(children: [
              const IconWidget(
                  icon: Icons.directions_car, color: AppColors.eighthColor),
              const SizedBox(
                width: 15,
              ),
              Text(
                StringsManager.instance
                    .getString(context, settings_page_add_car),
                style: const TextStyle(fontSize: 18, color: Colors.black87),
              ),
              const Expanded(child: SizedBox()),
            ]),
          ),
        ),
      ),
      onTap: () {
        addCar(context, _logic);
      },
    );
  }

  Widget buildRemoveCars(SettingsPageState state) {
    if (state is SettingsPageCarsLoadedState) {
      return GestureDetector(
        onTap: () {
          if (state.cars.isEmpty) {
            _showSnackBarSuccess(
                context,
                StringsManager.instance
                    .getString(context, settings_page_remove_car_no_car));
            return;
          }

          try {
            _logic.removeCarToUser(
                userId: AuthMiddleware.getUserId(context)!,
                carId: state.cars[_currentCar].id!);
            _showSnackBarSuccess(
                context,
                StringsManager.instance
                    .getString(context, settings_page_car_remove_successfully));

            setState(() {
              _currentCar = 0;
            });
          } catch (e) {
            _showSnackBarError(
                context,
                StringsManager.instance
                    .getString(context, settings_page_car_remove_error));
          }
        },
        child: Card(
          color: Colors.white,
          child: SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: Row(
                children: [
                  const IconWidget(
                      icon: Icons.directions_car, color: AppColors.eighthColor),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    StringsManager.instance
                        .getString(context, settings_page_remove_car),
                    style: TextStyle(fontSize: 18),
                  ),
                  const Expanded(child: SizedBox()),
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
                      state.cars.length,
                      (index) => DropdownMenuItem<int>(
                        value: index,
                        child: Text(state.cars[index].name),
                      ),
                    ),
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

  Widget buildChangePassword() {
    return Card(
      color: Colors.white,
      child: GestureDetector(
        child: SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4),
            child: Row(children: [
              const IconWidget(icon: Icons.lock, color: AppColors.eighthColor),
              const SizedBox(
                width: 15,
              ),
              Text(
                StringsManager.instance
                    .getString(context, settings_page_change_password),
                style: const TextStyle(fontSize: 18, color: Colors.black87),
              ),
              const Expanded(child: SizedBox()),
            ]),
          ),
        ),
        onTap: () {
          showChangePasswordDialog(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsPageLogic, SettingsPageState>(
      builder: (context, state) {
        if (state is SettingsPageCarsLoadedState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: widget.isDarkMode
                  ? AppColors.tenthColor
                  : AppColors.fifthColor,
              centerTitle: true,
              title: Text(
                StringsManager.instance.getString(context, app_title),
                style: widget.isDarkMode ? AppStyle.h1Dark : AppStyle.h1Light,
              ),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: widget.isDarkMode
                      ? AppColors.firstColor
                      : AppColors.ninthColor,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, HomePageNavigation.routeName);
                },
              ),
            ),
            body: SafeArea(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 22),
                children: [
                  buildProfileCard(context),
                  SettingsGroup(
                    title: StringsManager.instance
                        .getString(context, settings_page_profile),
                    children: <Widget>[
                      buildAddCars(),
                      buildRemoveCars(state),
                      buildChangePassword(),
                    ],
                  ),
                  SettingsGroup(
                    title: StringsManager.instance
                        .getString(context, settings_page_title),
                    children: <Widget>[
                      buildLanguage(),
                      buildDarkMode(),
                      buildLogout(context: context),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          _logic.fetchCars(userId: AuthMiddleware.getUserId(context)!);
          return Container();
        }
      },
    );
  }
}

class ChangePasswordDialog extends StatefulWidget {
  @override
  _ChangePasswordDialogState createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();

  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
      title: Text(StringsManager.instance
          .getString(context, settings_page_change_password)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _oldPasswordController,
            decoration: InputDecoration(
                labelText: StringsManager.instance
                    .getString(context, settings_page_old_password)),
            obscureText: true,
          ),
          TextField(
            controller: _newPasswordController,
            decoration: InputDecoration(
                labelText: StringsManager.instance
                    .getString(context, settings_page_new_password)),
            obscureText: true,
          ),
          TextField(
            controller: _confirmNewPasswordController,
            decoration: InputDecoration(
                labelText: StringsManager.instance
                    .getString(context, settings_page_confirm_new_password)),
            obscureText: true,
          ),
        ],
      ),
      actions: <Widget>[
        CarpoolButton.secondary(
          title: StringsManager.instance
              .getString(context, home_page_search_dialog_cancel),
          onTap: () {
            Navigator.of(context).pop();
          },
          width: MediaQuery.of(context).size.width / 4,
          height: 20,
          borderRadius: 5,
          isDarkMode: false,
          textSize: ButtonTextSize.small,
        ),
        CarpoolButton.secondary(
          title: StringsManager.instance
              .getString(context, settings_page_change_password),
          onTap: () async {
            String oldPassword = _oldPasswordController.text;
            String newPassword = _newPasswordController.text;
            String confirmNewPassword = _confirmNewPasswordController.text;

            if (newPassword == confirmNewPassword) {
              try {
                AuthCredential credential = EmailAuthProvider.credential(
                  email: FirebaseAuth.instance.currentUser!.email!,
                  password: oldPassword,
                );
                await FirebaseAuth.instance.currentUser!
                    .reauthenticateWithCredential(credential);

                await FirebaseAuth.instance.currentUser!
                    .updatePassword(newPassword);

                _showSnackBarSuccess(
                    context,
                    StringsManager.instance.getString(
                        context, settings_page_update_password_successful));
                Navigator.of(context).pop();
              } catch (error) {
                _showSnackBarError(
                    context,
                    StringsManager.instance.getString(
                        context, settings_page_update_password_old_pass_wrong));
              }
              Navigator.of(context).pop();
            } else {
              _showSnackBarError(
                  context,
                  StringsManager.instance.getString(
                      context, settings_page_update_password_failed));
            }
          },
          width: 125,
          height: 20,
          borderRadius: 5,
          isDarkMode: false,
          textSize: ButtonTextSize.small,
        ),
      ],
    );
  }
}

void showChangePasswordDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ChangePasswordDialog();
    },
  );
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

class AddCarPopUp extends StatefulWidget {
  final SettingsPageLogic logic;

  AddCarPopUp({required this.logic});

  @override
  _AddCarPopUpState createState() => _AddCarPopUpState();
}

class _AddCarPopUpState extends State<AddCarPopUp> {
  final TextEditingController _carNameController = TextEditingController();
  final TextEditingController _carModelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
          StringsManager.instance.getString(context, settings_page_add_car)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _carNameController,
            decoration: InputDecoration(
                labelText: StringsManager.instance
                    .getString(context, settings_page_car_name)),
          ),
          TextField(
            controller: _carModelController,
            decoration: InputDecoration(
                labelText:'${StringsManager.instance.getString(context, settings_page_car_consumption)} (L/100 km)',
          ),
          ),
        ],
      ),
      actions: <Widget>[
        CarpoolButton.secondary(
          title: StringsManager.instance
              .getString(context, home_page_search_dialog_cancel),
          onTap: () {
            Navigator.of(context).pop();
          },
          width: 100,
          height: 20,
          borderRadius: 5,
          isDarkMode: false,
          textSize: ButtonTextSize.small,
        ),
        CarpoolButton.secondary(
          title:
              StringsManager.instance.getString(context, settings_page_add_car),
          onTap: () async {
            String carName = _carNameController.text;
            String carConsumption = _carModelController.text;

            try {
              double d = double.parse(carConsumption) * 1.0;

              if (await widget.logic.addCarToUser(
                  userId: AuthMiddleware.getUserId(context)!,
                  carName: carName,
                  consumption: d)) {
                _showSnackBarSuccess(
                    context,
                    StringsManager.instance.getString(
                        context, settings_page_car_added_successfully));
                Navigator.of(context).pop();


                _carNameController.clear();
                _carModelController.clear();
              } else {
                _showSnackBarError(context, StringsManager.instance.getString(context, settings_page_error_adding_car));
              }
            } catch (e) {
              _showSnackBarError(context, StringsManager.instance.getString(context, settings_page_error_adding_car));
            }
          },
          width: 100,
          height: 20,
          borderRadius: 5,
          isDarkMode: false,
          textSize: ButtonTextSize.small,
        ),
      ],
    );
  }
}

void addCar(BuildContext context, SettingsPageLogic logic) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AddCarPopUp(
        logic: logic,
      );
    },
  );
}
