// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAFsMEcqqwiYQvIxKvfSpi2U4Uy1O-kSqY',
    appId: '1:183933611012:web:e16525cf2219ca1fd29951',
    messagingSenderId: '183933611012',
    projectId: 'tic-tac-toe-3c4e7',
    authDomain: 'tic-tac-toe-3c4e7.firebaseapp.com',
    storageBucket: 'tic-tac-toe-3c4e7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCMuzz6Zrrj6LA59SzSUUxnCP5alFabo7E',
    appId: '1:183933611012:android:0c37a6e509957f7ed29951',
    messagingSenderId: '183933611012',
    projectId: 'tic-tac-toe-3c4e7',
    storageBucket: 'tic-tac-toe-3c4e7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBR9ens2DU-84iP-deqRwyLC8oke3ql1j8',
    appId: '1:183933611012:ios:ab71cb3776a35905d29951',
    messagingSenderId: '183933611012',
    projectId: 'tic-tac-toe-3c4e7',
    storageBucket: 'tic-tac-toe-3c4e7.appspot.com',
    iosBundleId: 'com.dcaayush.codes.ticTacToe',
  );
}
