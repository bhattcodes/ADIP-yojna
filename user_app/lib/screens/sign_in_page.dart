// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:user_app/widgets/google_sign_in.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[400],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Image.asset(
                'assets/images/home.png',
              ),
              SizedBox(
                height: 30,
              ),
              Text("Login for Beneficiaries",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.red[900],
                      fontWeight: FontWeight.bold)),
              SignInButton(),
            ],
          ),
        ));
  }
}
