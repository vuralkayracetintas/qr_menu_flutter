import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_menu_flutter/feature/admin_login/login_page.dart';
import 'package:qr_menu_flutter/firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const AdminLoginPage(),
    );
  }
}
