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
  int _idx = 0;

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Color(kBackgroundColor),
      bottomNavigationBar: _idx == 2
          ? null
          : BottomNavigationBar(
              selectedLabelStyle: TextStyle(
                // color: Color(kActiveColor),
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: TextStyle(
                color: Color(kInActiveColor),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              backgroundColor: Color(kBackgroundColor),
              onTap: (value) {
                setState(() {
                  _idx = value;
                });
              },
              type: BottomNavigationBarType.fixed,
              mouseCursor: MouseCursor.defer,
              currentIndex: _idx,
              items: const [
                BottomNavigationBarItem(
                  // icon: Icon(Icons.home),
                  icon: SizedBox(),
                  label: '首页',
                ),
                BottomNavigationBarItem(
                  // icon: Icon(Icons.people),
                  icon: SizedBox(),
                  label: '朋友',
                ),
                BottomNavigationBarItem(
                  // icon: Icon(Icons.add),
                  icon: CustomPlusIcon(),
                  label: '',
                ),
                BottomNavigationBarItem(
                  // icon: Icon(Icons.sms),
                  icon: SizedBox(),
                  label: '消息',
                ),
                BottomNavigationBarItem(
                  // icon: Icon(Icons.account_circle),
                  icon: SizedBox(),
                  label: '我',
                ),
              ],
            ),
      body: pages[_idx],
    );
  }
}
