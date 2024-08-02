import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:douyin_clone/views/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  static String get screenId => '/loginScreen';

  @override
  Widget build(BuildContext) {
    return Scaffold(
      body: SignInScreen(
        providers: [
          EmailAuthProvider(),
        ],
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            if (!state.user!.emailVerified) {
              // Navigator.pushNamed(context, '/verify-email');
              // 不要求邮箱验证
              Navigator.pushReplacementNamed(context, HomeScreen.screenId);
            } else {
              Navigator.pushReplacementNamed(context, HomeScreen.screenId);
            }
          }),
          AuthStateChangeAction<SigningUp>((context, state) {
            Navigator.pushReplacementNamed(context, screenId);
          }),
        ],
      ),
    );
  }
}
