import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as firebase;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

class AuthenticationVeiw extends ConsumerStatefulWidget {
  const AuthenticationVeiw({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthenticationVeiwState();
}

class _AuthenticationVeiwState extends ConsumerState<AuthenticationVeiw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Giriş Paneli'),
      ),
      body: Theme(
        data: context.general.appTheme.copyWith(
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        child: Center(
          //TODO: Container ile çevir
          child: Padding(
            padding: context.padding.medium,
            child: firebase.LoginView(
              showTitle: false,
              action: firebase.AuthAction.signIn,
              providers: firebase.FirebaseUIAuth.providersFor(
                  FirebaseAuth.instance.app),
            ),
          ),
        ),
      ),
    );
  }
}
