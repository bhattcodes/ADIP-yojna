import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:user_app/screens/search.dart';

class FindAgencies extends StatefulWidget {
  const FindAgencies({Key? key}) : super(key: key);

  @override
  State<FindAgencies> createState() => _FindAgenciesState();
}

class _FindAgenciesState extends State<FindAgencies> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff3e9),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Container(
              height: 70,
              width: 375,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Expanded(
                      child: Text('ADIP Yojna',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                    Icon(Icons.account_circle, size: 35, color: Colors.deepOrange,),
                    Icon(Icons.add_to_home_screen, size: 35, color: Colors.deepOrange,),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
            child: Text('Find Agencies',
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30, right: 30,),
            child: Text('Sort through the list of available beneficiaries for you',
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 14
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
            child: Text('Choose Disability',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                )),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color?>(Colors.white),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
              ),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Search()),
                );
              },
              child: const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text('Choose Disability',
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ))
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}
