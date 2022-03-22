import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app/screens/findagencies.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

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
            child: Text('Welcome User!',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30, right: 30,),
            child: Text('Congratulations!',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 20
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30, right: 30,),
            child: Text('Your profile has been verified and you are eligible for the benefits',
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 15
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
            child: Container(
              height: 250,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                    child: Text('Find nearest agency!',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 130,
                      width: 280,
                      decoration: BoxDecoration(
                          color: const Color(0xfffff3e9),
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.announcement_rounded, color: Colors.deepOrange,),
                          ),
                          const Text('Find Nearest Implementing agency',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                primary: Colors.deepOrange
                              ),
                              child: const Text('Find Now!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const FindAgencies()),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Expanded(child: Image(image: AssetImage('assets/images/dashboarddesign.jpg')))
        ],
      ),
    );
  }
}
