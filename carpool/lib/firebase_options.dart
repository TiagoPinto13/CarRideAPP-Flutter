// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAfOa5rZCnbfgtVVw09cnmpDEfWODSwXk0',
    appId: '1:327598197311:web:aefde760ded4c3af50c68a',
    messagingSenderId: '327598197311',
    projectId: 'carpool-fbb36',
    authDomain: 'carpool-fbb36.firebaseapp.com',
    databaseURL: 'https://carpool-fbb36-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'carpool-fbb36.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZ-O5q1vuTG-m4Y3KYNb0w6Ohz8yNyrbA',
    appId: '1:327598197311:android:2185bd3a76f8436c50c68a',
    messagingSenderId: '327598197311',
    projectId: 'carpool-fbb36',
    databaseURL: 'https://carpool-fbb36-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'carpool-fbb36.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyChUSv0bWiFzj2rUrNkFnns_xKg7pzU_-I',
    appId: '1:327598197311:ios:26d3fbd4fad8ca4e50c68a',
    messagingSenderId: '327598197311',
    projectId: 'carpool-fbb36',
    databaseURL: 'https://carpool-fbb36-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'carpool-fbb36.appspot.com',
    iosBundleId: 'com.example.carpoll',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyChUSv0bWiFzj2rUrNkFnns_xKg7pzU_-I',
    appId: '1:327598197311:ios:3476aa6d400ce4e050c68a',
    messagingSenderId: '327598197311',
    projectId: 'carpool-fbb36',
    databaseURL: 'https://carpool-fbb36-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'carpool-fbb36.appspot.com',
    iosBundleId: 'com.example.carpoll.RunnerTests',
  );
}
