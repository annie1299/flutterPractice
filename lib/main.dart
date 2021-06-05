import 'package:flutter/material.dart';
import 'package:flutterPractice/constants.dart';
import 'package:flutterPractice/sharedPreferences/sharedPrefExam.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'loginScrreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var loginInfo = prefs.getBool('loginInfo');
  print(loginInfo);

  runApp(
    MaterialApp(
      title: 'MAD',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: loginInfo == true ? SharedPrefExam() : LoginScreen(),
    ),
  );
}
