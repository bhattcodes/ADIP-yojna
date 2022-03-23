import 'package:flutter/material.dart';

import '../utils/colors.dart';

class UdidDetails extends StatefulWidget {
  const UdidDetails({Key? key}) : super(key: key);

  @override
  State<UdidDetails> createState() => _UdidDetailsState();
}

class _UdidDetailsState extends State<UdidDetails> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfffff3e9),
      body: Center(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/udid_screen.png',
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("UDID Details",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.brown[700],
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter The Udid registration Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 40)),
                  Container(
                    child: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: primaryColor,
                            ),
                          )
                        : const Text('Next'),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        color: Color(0xffFDA758)),
                  )
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
