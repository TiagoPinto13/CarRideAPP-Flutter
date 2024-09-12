import 'package:carpool/pages/home_page_navigation.dart';
import 'package:carpool/pages/initial_page/initial_page_logic.dart';
import 'package:carpool/pages/login_page.dart';
import 'package:carpool/pages/signup_page.dart';
import 'package:carpool/ui/app_button.dart';
import 'package:carpool/utils/strings/managers/strings_managers.dart';
import 'package:carpool/utils/strings/strings_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialPage extends StatefulWidget {
  static const routeName = "/initialPage";
  bool isDarkMode;

  InitialPage({super.key, required this.isDarkMode});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  Widget _BuildImage(
      {required BuildContext context,
      required InitialPageState state,
      required InitialPageLogic cubit}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Image.asset('assets/images/car.png'),
    );
  }

  Widget _buildCreateAccountButton(
      {required BuildContext context,
      required InitialPageState state,
      required InitialPageLogic cubit}) {
    return CarpoolButton.primary(
      title: StringsManager.instance
          .getString(context, initial_page_create_account),
      onTap: () => {
        Navigator.of(context).pushNamed(SignupPage.routeName),
      },
      width: 350,
      height: 60,
      borderRadius: 5,
      isDarkMode: state.isDarkMode,
      textSize: ButtonTextSize.high,
    );
  }

  Widget _buildLoginButton(
      {required BuildContext context,
      required InitialPageState state,
      required InitialPageLogic cubit}) {
    return CarpoolButton.third(
      title: StringsManager.instance.getString(context, initial_page_log_in),
      onTap: () => {
        Navigator.of(context).pushNamed(LoginPage.routeName),
      },
      width: 350,
      height: 60,
      borderRadius: 5,
      isDarkMode: state.isDarkMode,
      textSize: ButtonTextSize.high,
    );
  }

  Widget _buildProceedWithoutLoginButton(
      {required BuildContext context,
      required InitialPageState state,
      required InitialPageLogic cubit}) {
    return CarpoolButton.primary(
      title: StringsManager.instance
          .getString(context, initial_page_create_proccede_without_log_in),
      onTap: () => {
        Navigator.of(context).pushNamed(HomePageNavigation.routeName),
      },
      width: 350,
      height: 60,
      borderRadius: 5,
      isDarkMode: state.isDarkMode,
      textSize: ButtonTextSize.high,
    );
  }

  Widget _buildButtons(
      {required BuildContext context,
      required InitialPageState state,
      required InitialPageLogic cubit}) {
    return Column(
      children: [
        _buildCreateAccountButton(context: context, state: state, cubit: cubit),
        const SizedBox(
          height: 10,
        ),
        _buildLoginButton(context: context, state: state, cubit: cubit),
        const SizedBox(
          height: 10,
        ),
        _buildProceedWithoutLoginButton(
            context: context, state: state, cubit: cubit),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InitialPageLogic>();

    return BlocBuilder<InitialPageLogic, InitialPageState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox( height: 15,),
                _BuildImage(context: context, state: state, cubit: cubit),
                Text(
                  StringsManager.instance
                      .getString(context, initial_page_welcome),
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
                Text(
                  StringsManager.instance
                      .getString(context, initial_page_string),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                _buildButtons(context: context, state: state, cubit: cubit),
              ],
            ),
          ),
        );
      },
    );
  }
}
