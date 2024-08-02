import 'package:douyin_clone/views/widgets/custom_plus_icon.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:douyin_clone/constants.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  static String get screenId => '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int idx = 0;

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            idx = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        mouseCursor: MouseCursor.defer,
        currentIndex: idx,
        items: [
          BottomNavigationBarItem(
            // icon: Icon(Icons.home),
            icon: SizedBox.shrink(),
            label: '首页',
          ),
          BottomNavigationBarItem(
            // icon: Icon(Icons.people),
            icon: SizedBox.shrink(),
            label: '朋友',
          ),
          BottomNavigationBarItem(
            // icon: Icon(Icons.add),
            icon: CustomPlusIcon(),
            label: '',
          ),
          BottomNavigationBarItem(
            // icon: Icon(Icons.sms),
            icon: SizedBox.shrink(),
            label: '消息',
          ),
          BottomNavigationBarItem(
            // icon: Icon(Icons.account_circle),
            icon: SizedBox.shrink(),
            label: '我',
          ),
        ],
      ),
      body: pages[idx],
    );
  }
}
