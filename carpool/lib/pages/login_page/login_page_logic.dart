import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_page_state.dart';
part 'login_page_logic.freezed.dart';

class LoginPageLogic extends Cubit<LoginPageState> {
  final bool isDarkMode;
  final bool isObscured = false;
  final _auth = FirebaseAuth.instance;

  LoginPageLogic({required this.isDarkMode})
      : super(LoginPageState.loaded(isDarkMode: isDarkMode));

   void changeObscured() {
    final bool newObscured = !state.isObscured;
    emit(LoginPageState.loaded(isObscured: newObscured));
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      emit(LoginPageState.loading(isDarkMode: isDarkMode, isObscured: isObscured));

      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      return null;
    }
  }
}
