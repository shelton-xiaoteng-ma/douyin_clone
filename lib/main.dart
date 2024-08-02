import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:douyin_clone/views/screens/auth/login_screen.dart';
import 'package:douyin_clone/views/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Douyin Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        // '/
        HomeScreen.screenId: (context) => HomeScreen(),
        LoginScreen.screenId: (context) => LoginScreen(),
      },
      initialRoute: user != null ? HomeScreen.screenId : LoginScreen.screenId,
    );
  }
}
