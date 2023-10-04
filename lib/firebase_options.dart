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
    apiKey: 'AIzaSyDKIK6mpdlr5Z8ZlblpGkFB38NzTMqsxbw',
    appId: '1:677943389995:web:41f02c4079df2e23e25f6e',
    messagingSenderId: '677943389995',
    projectId: 'beyoundthecall',
    authDomain: 'beyoundthecall.firebaseapp.com',
    storageBucket: 'beyoundthecall.appspot.com',
    measurementId: 'G-4EQBE2XD04',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBA6Bbrws9h9AFELD9LNQFCaONgy0V0kaE',
    appId: '1:677943389995:android:a32b0f840c066c6de25f6e',
    messagingSenderId: '677943389995',
    projectId: 'beyoundthecall',
    storageBucket: 'beyoundthecall.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBQvpiUOvayp1pqCB2Lq87WB9qnrM6U_SI',
    appId: '1:677943389995:ios:d6660a139c4c67a8e25f6e',
    messagingSenderId: '677943389995',
    projectId: 'beyoundthecall',
    storageBucket: 'beyoundthecall.appspot.com',
    iosBundleId: 'com.example.beyoundthecall',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBQvpiUOvayp1pqCB2Lq87WB9qnrM6U_SI',
    appId: '1:677943389995:ios:5e80d1ae8f3003d6e25f6e',
    messagingSenderId: '677943389995',
    projectId: 'beyoundthecall',
    storageBucket: 'beyoundthecall.appspot.com',
    iosBundleId: 'com.example.beyoundthecall.RunnerTests',
  );
}