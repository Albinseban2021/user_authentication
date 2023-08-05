import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user_authentication/home.dart';
import 'package:user_authentication/phone.dart';
import 'package:user_authentication/profile.dart';
import 'package:user_authentication/verify.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Authentication',
      theme: ThemeData(
        primaryColor: Color(0xFF2e3b62),
        primarySwatch: customPrimaryColor,
      ),
      home: Scaffold(
        body: Center(
          child: Home(),
        ),
      ),
    );
  }
}

MaterialColor customPrimaryColor = MaterialColor(
  0xFF2e3b62,
  <int, Color>{
    50: Color(0xFFe6e8ed),
    100: Color(0xFFb9bdd0),
    200: Color(0xFF8a90b3),
    300: Color(0xFF5b6697),
    400: Color(0xFF394f80),
    500: Color(0xFF2e3b62), // Set the primary color here
    600: Color(0xFF283553),
    700: Color(0xFF222e44),
    800: Color(0xFF1c2835),
    900: Color(0xFF111a26),
  },
);
