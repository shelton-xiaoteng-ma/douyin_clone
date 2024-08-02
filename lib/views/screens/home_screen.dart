import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String get screenId => '/';

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(),
                flex: 10,
              ),
              Expanded(
                flex: 3,
                child: Text('当前用户: ${user!.displayName}'),
              ),
              Expanded(
                child: TextButton(
                  child: Text('Home'),
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: Container(),
                flex: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
