import 'package:carpool/network/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_page_state.dart';
part 'signup_page_logic.freezed.dart';

class SignupPageLogic extends Cubit<SignupPageState> {
  final bool isDarkMode;
  final bool isObscured = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserRepository userRepository = UserRepository();

  SignupPageLogic({required this.isDarkMode})
      : super(SignupPageState.loaded(isDarkMode: isDarkMode));

  void changeObscured() {
    final bool newObscured = !state.isObscured;
    emit(SignupPageState.loaded(isObscured: newObscured));
  }

  void changeState() {
    emit(SignupPageState.buttonPressed(
        isDarkMode: state.isDarkMode, isObscured: state.isObscured));
  }

  Future<bool> addUser({
    required String name,
    required String username,
    required String email,
    required String password,
    required String gender,
  }) async {
    try {
      emit(SignupPageState.buttonPressed(
          isDarkMode: state.isDarkMode, isObscured: state.isObscured));

      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        String uid = userCredential.user!.uid;

        await userRepository.addUser(
          id: uid,
          name: name,
          username: username,
          email: email,
          gender: gender,
        );
      }

      return true;
    } catch (e) {
      print('Error adding user: $e');

      emit(SignupPageState.loaded(
          isDarkMode: isDarkMode, isObscured: isObscured));

      return false;
    }
  }
}
