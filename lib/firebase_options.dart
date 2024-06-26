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
    apiKey: 'AIzaSyCvg3EuRgbgXIKe6IM91RJICu9VM012W0Y',
    appId: '1:947595912716:web:2ad0f4d06dc0c285f33029',
    messagingSenderId: '947595912716',
    projectId: 'flutter-full-newss',
    authDomain: 'flutter-full-newss.firebaseapp.com',
    databaseURL: 'https://flutter-full-newss-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'flutter-full-newss.appspot.com',
    measurementId: 'G-CG8XH4X58N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD7lhPcwyvAF3N2FWPI5oaFI2C2FEvqdiU',
    appId: '1:947595912716:android:47b74c996a6ef535f33029',
    messagingSenderId: '947595912716',
    projectId: 'flutter-full-newss',
    databaseURL: 'https://flutter-full-newss-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'flutter-full-newss.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTv-vB1y-wnqQjmxTbPezeIGqLmIbeYE0',
    appId: '1:947595912716:ios:5d2e3cb92a71beaef33029',
    messagingSenderId: '947595912716',
    projectId: 'flutter-full-newss',
    databaseURL: 'https://flutter-full-newss-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'flutter-full-newss.appspot.com',
    iosBundleId: 'com.jazherine.flutterFirebaseFullNewsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBTv-vB1y-wnqQjmxTbPezeIGqLmIbeYE0',
    appId: '1:947595912716:ios:4b87b9f570a6f5c7f33029',
    messagingSenderId: '947595912716',
    projectId: 'flutter-full-newss',
    databaseURL: 'https://flutter-full-newss-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'flutter-full-newss.appspot.com',
    iosBundleId: 'com.jazherine.flutterFirebaseFullNewsApp.RunnerTests',
  );
}
