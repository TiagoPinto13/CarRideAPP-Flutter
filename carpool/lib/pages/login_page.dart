import 'package:carpool/providers/user_provider.dart';
import 'package:carpool/pages/home_page_navigation.dart';
import 'package:carpool/pages/login_page/login_page_logic.dart';
import 'package:carpool/pages/signup_page.dart';
import 'package:carpool/theme/app_colors.dart';
import 'package:carpool/ui/app_button.dart';
import 'package:carpool/ui/signup_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../utils/strings/managers/strings_managers.dart';
import '../utils/strings/strings_constants.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/loginPage";
  bool isDarkMode;
  LoginPage({super.key, required this.isDarkMode});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _loginController = TextEditingController();

  bool _isLoading = false;

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

  Widget _buildBodyCard(
      {required BuildContext context,
      required LoginPageState state,
      required LoginPageLogic cubit}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              StringsManager.instance.getString(context, login_page_string),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          // Email
          Card(
            color: Colors.white,
            margin: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(color: Colors.grey),
            ),
            child: TextFormField(
              controller: _loginController,
              decoration: InputDecoration(
                labelText: StringsManager.instance
                    .getString(context, signup_page_email),
                labelStyle: const TextStyle(color: Colors.black),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              ),
            ),
          ),
          // Password
          Card(
            color: Colors.white,
            margin: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(color: Colors.grey),
            ),
            child: TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  padding: const EdgeInsetsDirectional.only(end: 12.0),
                  icon: state.isObscured
                      ? const Icon(
                          Icons.visibility,
                          color: Colors.black,
                        )
                      : const Icon(
                          Icons.visibility_off,
                          color: Colors.black,
                        ),
                  onPressed: () {
                    cubit.changeObscured();
                  },
                ),
                labelText: StringsManager.instance
                    .getString(context, signup_page_password),
                labelStyle: const TextStyle(color: Colors.black),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              ),
              obscureText: state.isObscured,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogInButton(
      {required BuildContext context,
      required LoginPageState state,
      required LoginPageLogic cubit}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: CarpoolButton.primary(
        title: StringsManager.instance.getString(context, login_page_string),
        onTap: () async {
          String login = _loginController.text.trim();
          String password = _passwordController.text.trim();

          if (login.isNotEmpty && password.isNotEmpty) {
            setState(() {
              _isLoading = true;
            });

            User? user =
                await cubit.signInWithEmailAndPassword(login, password);
            if (user != null) {
              Provider.of<UserProvider>(context, listen: false).setUser(user);
              _showSnackBarSuccess(
                  context,
                  StringsManager.instance
                      .getString(context, login_page_login_successful));
              Navigator.of(context).pushNamed(HomePageNavigation.routeName);
            } else {
              setState(() {
                _isLoading = false;
              });
              _showSnackBarError(
                  context,
                  StringsManager.instance
                      .getString(context, login_page_login_failed));
            }
          } else {
            _showSnackBarError(
                context,
                StringsManager.instance
                    .getString(context, login_page_empty_fields));
          }
        },
        width: 300,
        height: 60,
        borderRadius: 5,
        isDarkMode: state.isDarkMode,
        textSize: ButtonTextSize.high,
      ),
    );
  }

  Widget _buildDivider(
      {required BuildContext context, required LoginPageState state}) {
    return Row(
      children: [
        const Flexible(
          child: Divider(
              color: Colors.grey, thickness: 0.5, indent: 60, endIndent: 5),
        ),
        Text(
          StringsManager.instance.getString(context, signup_page_or),
          style: const TextStyle(color: Colors.black),
        ),
        const Flexible(
          child: Divider(
              color: Colors.grey, thickness: 0.5, indent: 5, endIndent: 60),
        ),
      ],
    );
  }

  Widget _buildRegisterText(
      {required BuildContext context,
      required LoginPageState state,
      required LoginPageLogic cubit}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            StringsManager.instance
                .getString(context, login_page_not_yet_registered),
            style: const TextStyle(fontSize: 16),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(SignupPage.routeName);
            },
            child: Text(
              StringsManager.instance.getString(context, login_page_signup),
              style: const TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginPageLogic>();

    return BlocBuilder<LoginPageLogic, LoginPageState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: SignUpAppBar(
            isDarkMode: widget.isDarkMode,
            title: StringsManager.instance
                .getString(context, signup_page_back_button),
            onBackTap: () {
              Navigator.pop(context);
            },
          ),
          body: !_isLoading ? SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 5),
                _buildBodyCard(context: context, state: state, cubit: cubit),
                const SizedBox(height: 100),
                _buildLogInButton(context: context, state: state, cubit: cubit),
                _buildDivider(context: context, state: state),
                _buildRegisterText(
                    context: context, state: state, cubit: cubit),
              ],
            ),
          ) : const Center(child: const CircularProgressIndicator(),),
        );
      },
    );
  }
}
