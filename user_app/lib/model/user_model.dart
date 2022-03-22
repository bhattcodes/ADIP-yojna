import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String udid;
  final String name;
  final String mobile;
  final String email;
  final String state;

  const User({
    required this.udid,
    required this.name,
    required this.mobile,
    required this.email,
    required this.state,
  });

  Map<String, dynamic> toJson() => {
        "udid": udid,
        "name": name,
        "mobile": mobile,
        "email": email,
        "state": state,
      };

  // take a docmnt snap and convert it into user model

  // static User fromSnap(DocumentSnapshot snap) {
  //   var snapshot = snap.data() as Map<String, dynamic>;
  //   return User(
  //
  //   );
  // }
}
