import 'package:carpool/datamodel/user.dart';
import 'package:carpool/network/user_repository.dart';
import 'package:carpool/pages/login_page.dart';
import 'package:carpool/utils/strings/strings_constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../utils/strings/managers/strings_managers.dart';

class AuthMiddleware {
  static bool isLoggedIn(BuildContext context) {
    User? user = Provider.of<UserProvider>(context, listen: false).user;
    return user != null;
  }

  static String? getUserId(BuildContext context) {
    User? user = Provider.of<UserProvider>(context, listen: false).user;
    return user?.uid;
  }

  static Future<MyUser?> getUser(String id) async {
    final UserRepository user = UserRepository();
    return await user.fetchUser(id: id);
  }


  static void logout(BuildContext context) {
    Provider.of<UserProvider>(context, listen: false).logout();
  }

  static void navigateIfLoggedIn(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            StringsManager.instance
                .getString(context, home_page_search_dialog_title),
          ),
          content: Text(
            StringsManager.instance
                .getString(context, home_page_search_dialog_body),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(LoginPage.routeName);
                  },
                  child: Text(StringsManager.instance
                      .getString(context, home_page_search_dialog_login)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(StringsManager.instance
                      .getString(context, home_page_search_dialog_cancel)),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
