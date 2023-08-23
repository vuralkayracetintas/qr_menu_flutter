import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      body: firebase.LoginView(
        action: firebase.AuthAction.signIn,
        providers:
            firebase.FirebaseUIAuth.providersFor(FirebaseAuth.instance.app),
      ),
    );
  }
}
