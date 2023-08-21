import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_menu_flutter/feature/home/home_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: Colors.white),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
