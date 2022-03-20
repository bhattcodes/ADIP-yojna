// ignore_for_file: dead_code

import 'dart:async';

import 'package:flutter/material.dart';

import 'sign_in_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignInPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.amber[400],
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/emblem.png',
                ),
                Text("ADIP YOJNA APP",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.red[900],
                        fontWeight: FontWeight.bold))
              ],
            ),
            const SizedBox(height: 100),
            CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
          ]),
    ));
  }
}
