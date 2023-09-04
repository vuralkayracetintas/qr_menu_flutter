// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

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
      // ignore: no_default_cases
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBenRyYAo8ZQSq2XJNQPX39tTkY-oV1AiQ',
    appId: '1:371589002580:web:5ed5ba7e5788582c3cc4c1',
    messagingSenderId: '371589002580',
    projectId: 'qr-menu1',
    authDomain: 'qr-menu1.firebaseapp.com',
    storageBucket: 'qr-menu1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDfpxnqpTedBhuKzUKgbfgHQsbKvaKY6Ec',
    appId: '1:371589002580:android:82f918fe365ecc5d3cc4c1',
    messagingSenderId: '371589002580',
    projectId: 'qr-menu1',
    storageBucket: 'qr-menu1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCtHmxqH66rn8I5U2lwxngMkB4zI3hmcuY',
    appId: '1:371589002580:ios:1778e226dd3b58ca3cc4c1',
    messagingSenderId: '371589002580',
    projectId: 'qr-menu1',
    storageBucket: 'qr-menu1.appspot.com',
    iosClientId:
        '371589002580-uhe4hu38m37l0du9ngkbbj6jkvdj6l7d.apps.googleusercontent.com',
    iosBundleId: 'com.example.qrMenuFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCtHmxqH66rn8I5U2lwxngMkB4zI3hmcuY',
    appId: '1:371589002580:ios:9bb847c4e7487e303cc4c1',
    messagingSenderId: '371589002580',
    projectId: 'qr-menu1',
    storageBucket: 'qr-menu1.appspot.com',
    iosClientId:
        '371589002580-chbv7n9md5irncf00qmldkifln4kv7n7.apps.googleusercontent.com',
    iosBundleId: 'com.example.qrMenuFlutter.RunnerTests',
  );
}
