import 'dart:developer';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:user_app/model/user_model.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  UserCredential? cred;
  String uid = "";

  void signInWithGoogle() async {
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
    cred = await _auth.signInWithCredential(credential);

    uid = _auth.currentUser!.uid;
  }

// add null values udid to the firebase
  Future<String> addUdids({
    required String udid,
  }) async {
    String res = "some error occured";
    try {
      if (udid.isNotEmpty) {
        // adding user with null values!
        model.User user = model.User(
          udid: udid,
          name: "",
          mobile: "",
          email: "",
          state: "",
        );

        await _firestore.collection('users').doc(udid).set(
              user.toJson(), //since the firestore accepts MAP so we created the convertor of string to json in user.dart
            );

        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

// get data from firebase
  Future<model.User> getdata({
    required String udid,
  }) async {
    DocumentSnapshot snap =
        await _firestore.collection('users').doc(udid).get();
    return model.User.fromSnap(snap);
  }

  //signup user
  Future<String> signUpUser({
    required String udid,
    required String name,
    required String mobile,
    required String email,
    required String state,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty ||
          udid.isNotEmpty ||
          mobile.isNotEmpty ||
          state.isNotEmpty) {
        // register user

        // print(udid);
        // print(cred);

        // modeling our userdata and adding to FB database

        model.User user = model.User(
          udid: udid,
          name: name,
          mobile: mobile,
          email: email,
          state: state,
        );

        await _firestore.collection('users').doc(udid).set(
              user.toJson(), //since the firestore accepts MAP so we created the convertor of string to json in user.dart
            );

        res = "success";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = 'The email is badly formatted';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
