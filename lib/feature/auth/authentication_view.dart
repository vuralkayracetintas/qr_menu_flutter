import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:qr_menu_flutter/core/widgets/text_widgets.dart';
import 'package:qr_menu_flutter/feature/admin_home/admin_home_page.dart';
import 'package:qr_menu_flutter/product/constants/image_constants.dart';
import 'package:qr_menu_flutter/product/constants/string_constants.dart';

class AuthenticationVeiw extends ConsumerStatefulWidget {
  const AuthenticationVeiw({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthenticationVeiwState();
}

class _AuthenticationVeiwState extends ConsumerState<AuthenticationVeiw> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600 || constraints.maxHeight <= 600) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(StringConstants.adminPanelName),
            ),
            body: Padding(
              padding: context.padding.normal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  firebase.FirebaseUIActions(
                    actions: [
                      _fireBaseLoginMethod(),
                    ],
                    child: const _FirebaseLoginUI(),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text(StringConstants.adminPanelName),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Card(
                    elevation: 10,
                    child: SizedBox(
                      width: 500,
                      height: 600,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: context.padding.medium,
                              child: Column(
                                children: [
                                  const TitleText(
                                    titleText: StringConstants.adminWelcome,
                                  ),
                                  SizedBox(
                                    height: context.sized.dynamicHeight(0.1),
                                  ),
                                  firebase.FirebaseUIActions(
                                    actions: [
                                      _fireBaseLoginMethod(),
                                    ],
                                    child: const _FirebaseLoginUI(),
                                  ),
                                  const Expanded(
                                    child: SizedBox(),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Text(StringConstants.projectON),
                                      Image.asset(
                                        ImageConstants.logo.toPng,
                                        height:
                                            context.sized.dynamicHeight(0.15),
                                        width:
                                            context.sized.dynamicHeight(0.15),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  AuthStateChangeAction<SignedIn> _fireBaseLoginMethod() {
    return AuthStateChangeAction<SignedIn>((context, state) {
      if (state.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AdminHomePage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            duration: Duration(seconds: 10),
            content: Text(StringConstants.permissionErrorMessage),
          ),
        );
      }
    });
  }
}

class _FirebaseLoginUI extends StatelessWidget {
  const _FirebaseLoginUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return firebase.LoginView(
      showTitle: false,
      action: firebase.AuthAction.signIn,
      providers: firebase.FirebaseUIAuth.providersFor(
        FirebaseAuth.instance.app,
      ),
    );
  }
}



//! TODO
//TODO: #10 otomatik doldur dendiğinde crash veriyor live test yapılması lazım.
