// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DocsInputPage extends StatelessWidget {
  const DocsInputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.amber[400],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/form.png',
                height: 100,
              ),
              SizedBox(
                height: 30,
              ),
              Text("User Details Input",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.red[900],
                      fontWeight: FontWeight.bold)),
              Container(
                padding: const EdgeInsets.all(40),
                child: Center(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(hintText: "Udid No."),
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: "Name"),
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: "Mobile"),
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: "State"),
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: "Email"),
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: "Aadhar number"),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red[900],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
