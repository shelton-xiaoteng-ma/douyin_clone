import 'package:douyin_clone/views/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'views/screens/add_video_screen.dart';
import 'views/screens/camera_screen.dart';

List<Widget> pages = [
  Text('HomeScreen'),
  Text('FriendScreen'),
  // AddVideoScreen(),
  CameraScreen(),
  AddVideoScreen(),
  ProfileScreen(),
];

// colors
const kBackgroundColor = 0xFF171717;
const kActiveColor = 0xFFFFFFFF;
const kInActiveColor = 0xFF969696;
