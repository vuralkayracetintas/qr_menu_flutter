import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:qr_menu_flutter/firebase_options.dart';

class ApplicationStart {
  const ApplicationStart._();
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await DeviceUtility.instance.initPackageInfo();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
    ]);
  }
}
