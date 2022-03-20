// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_new

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    Future<UserCredential?> signInWithGoogle() async {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Once signed in, return the UserCredential
      return await auth.signInWithCredential(credential);
    }

    return Center(
      child: Container(
        width: double.infinity,
        height: 50,
        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xff4285F4),
              padding: EdgeInsets.all(2),
            ),
            onPressed: () {
              signInWithGoogle();
            },
            child: new Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    'assets/google.png',
                    height: 25.0,
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: 45.0, right: 10.0),
                    child: new Text(
                      "Sign in with Google",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    )),
              ],
            )),
      ),
    );
  }
}
