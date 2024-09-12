import 'package:carpool/pages/login_page.dart';
import 'package:carpool/pages/signup_page/signup_page_logic.dart';
import 'package:carpool/theme/app_colors.dart';
import 'package:carpool/ui/app_button.dart';
import 'package:carpool/ui/signup_app_bar.dart';
import 'package:carpool/utils/strings/managers/strings_managers.dart';
import 'package:carpool/utils/strings/strings_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SignupPage extends StatefulWidget {
  static const String routeName = "/signupPage";
  bool isDarkMode;

  SignupPage({super.key, required this.isDarkMode});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

enum Gender {
  male,
  female,
  other,
}

String genderToString(BuildContext context, Gender gender) {
  String res;

  switch (gender) {
    case Gender.male:
      res = StringsManager.instance.getString(context, signup_page_gender_male);
      break;
    case Gender.female:
      res =
          StringsManager.instance.getString(context, signup_page_gender_female);
      break;
    case Gender.other:
      res =
          StringsManager.instance.getString(context, signup_page_gender_other);
      break;
  }
  return res;
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupPageLogic(isDarkMode: widget.isDarkMode),
      child: _BuildSignUpPage(isDarkMode: widget.isDarkMode),
    );
  }
}

class _BuildSignUpPage extends StatefulWidget {
  bool isDarkMode;
  _BuildSignUpPage({super.key, required this.isDarkMode});
  @override
  _BuildSignUpPageState createState() => _BuildSignUpPageState();
}

class _BuildSignUpPageState extends State<_BuildSignUpPage> {
  late SignupPageLogic _logic;
  Gender _selectedGender = Gender.male;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _logic = context.read<SignupPageLogic>();
  }

  bool _validateForm(BuildContext context) {
    if (_nameController.text.isEmpty) {
      _showSnackBarError(
          context,
          StringsManager.instance
              .getString(context, signup_page_validate_null_name));
      return false;
    }
    if (_usernameController.text.isEmpty) {
      _showSnackBarError(
          context,
          StringsManager.instance
              .getString(context, signup_page_validate_null_username));
      return false;
    }
    if (_emailController.text.isEmpty) {
      _showSnackBarError(
          context,
          StringsManager.instance
              .getString(context, signup_page_validate_null_email));
      return false;
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(_emailController.text)) {
      _showSnackBarError(
          context,
          StringsManager.instance
              .getString(context, signup_page_validate_email_expression));
      return false;
    }
    if (_passwordController.text.isEmpty) {
      _showSnackBarError(
          context,
          StringsManager.instance
              .getString(context, signup_page_validate_password_null));
      return false;
    }

    if (_passwordController.text.length < 6) {
      _showSnackBarError(
          context,
          StringsManager.instance
              .getString(context, signup_page_validate_password_min_length));
      return false;
    }

    if (!_passwordController.text.contains(RegExp(r'[A-Z]'))) {
      _showSnackBarError(
          context,
          StringsManager.instance.getString(
              context, signup_page_validate_password_check_uppercase));
      return false;
    }

    if (!_passwordController.text.contains(RegExp(r'[0-9]'))) {
      _showSnackBarError(
          context,
          StringsManager.instance
              .getString(context, signup_page_validate_password_check_numbers));
      return false;
    }

    if (!_passwordController.text.contains(RegExp(r'[!@#&%^&*(),.?":{}|<>]'))) {
      _showSnackBarError(
          context,
          StringsManager.instance.getString(
              context, signup_page_validate_password_check_special_characters));
      return false;
    }
    if (_confirmPasswordController.text != _passwordController.text) {
      _showSnackBarError(
          context,
          StringsManager.instance.getString(
              context, signup_page_validate_password_check_other_pass));
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

  Widget _buildBodyCard(
      {required BuildContext context, required SignupPageState state}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              StringsManager.instance.getString(context, signup_page_title),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          // Name
          Card(
            color: Colors.white,
            margin: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(color: Colors.grey),
            ),
            child: TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: StringsManager.instance
                    .getString(context, signup_page_name),
                labelStyle: const TextStyle(color: Colors.black),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              ),
            ),
          ),
          // Username
          Card(
            color: Colors.white,
            margin: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(color: Colors.grey),
            ),
            child: TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: StringsManager.instance
                    .getString(context, signup_page_username),
                labelStyle: const TextStyle(color: Colors.black),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              ),
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
              controller: _emailController,
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
                    _logic.changeObscured();
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

          // Confirm Password
          Card(
            color: Colors.white,
            margin: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(color: Colors.grey),
            ),
            child: TextFormField(
              controller: _confirmPasswordController,
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
                    _logic.changeObscured();
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
          // Gender
          Card(
            color: Colors.white,
            margin: const EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(color: Colors.grey),
            ),
            child: DropdownButtonFormField<Gender>(
              decoration: InputDecoration(
                labelText: StringsManager.instance
                    .getString(context, signup_page_gender),
                labelStyle: const TextStyle(color: Colors.black),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              ),
              value: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value!;
                });
              },
              items: Gender.values.map<DropdownMenuItem<Gender>>((gender) {
                return DropdownMenuItem<Gender>(
                  value: gender,
                  child: Text(
                    genderToString(context, gender),
                    style: const TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpButton(
      {required BuildContext context, required SignupPageState state}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: CarpoolButton.primary(
        title: StringsManager.instance
            .getString(context, signup_page_sign_up_button),
        onTap: () async => {
          if (_validateForm(context))
            {
              if (await _logic.addUser(
                  name: _nameController.text,
                  username: _usernameController.text,
                  email: _emailController.text,
                  password: _passwordController.text,
                  gender: _selectedGender.toString()))
                {
                  _showSnackBarSuccess(
                      context,
                      StringsManager.instance
                          .getString(context, signup_page_signup_successful)),
                  Navigator.of(context).pushNamed(LoginPage.routeName),
                }
              else
                {
                  _showSnackBarError(
                      context,
                      StringsManager.instance.getString(
                          context, signup_page_signup_unsuccessfull)),
                }
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
      {required BuildContext context, required SignupPageState state}) {
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

  Widget _buildSignInText({
    required BuildContext context,
    required SignupPageState state,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            StringsManager.instance
                .getString(context, signup_page_already_have_an_account),
            style: const TextStyle(fontSize: 16),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(LoginPage.routeName);
            },
            child: Text(
              StringsManager.instance.getString(
                  context, signup_page_already_have_an_account_sing_in),
              style: const TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(
      {required BuildContext context, required SignupPageState state}) {
    if (state is SignupPageLoadedState) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildBodyCard(context: context, state: state),
          _buildSignUpButton(context: context, state: state),
          _buildDivider(context: context, state: state),
          _buildSignInText(context: context, state: state)
        ],
      );
    } else if (state is SignupPageButtonPressedState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupPageLogic, SignupPageState>(
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
          body: SingleChildScrollView(
            child: _buildBody(context: context, state: state),
          ),
        );
      },
    );
  }
}
