import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchDisability extends StatefulWidget {
  const SearchDisability({Key? key}) : super(key: key);

  @override
  State<SearchDisability> createState() => _SearchDisabilityState();
}

class _SearchDisabilityState extends State<SearchDisability> {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var list = [];
  List? newlist = [];
  final myController = TextEditingController();
  Map ? l_course = Map();
  bool load = false;
  late String suggest;

  @override
  void initState() {
    super.initState();
    suggest = '';

    suggest = 'Enter the full name of your college/board';
    firestore
        .collection('disabilities')
        .doc('fqq5nl88SAWd7RPZcnVa')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        list=documentSnapshot['disability type'];
        print(list);
      }
      setState(() {
        newlist = List.from(list);
        print(newlist);
      });
    })
        .catchError((error){
      print(error);
    });

  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    search( String name ){
      newlist!.clear();
      if(name!=''){
        for(String e in list){
          if(e.contains(name)){
            newlist!.add(e);
            print(newlist);
          }
        }
      }
      setState((){});
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 50, 24, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Suggestions',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: TextField(
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.blueGrey[50],
                  hintText: 'Type Here',
                  hintStyle: TextStyle(
                    color: Colors.blueGrey[400],
                  ),
                ),
                controller: myController,
                onChanged: (text) {
                  search(text.toLowerCase());
                },
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: newlist!.length,
                separatorBuilder: (BuildContext context, int index) => Divider(),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(newlist![index].toString()),
                    onTap: (){
                      myController.text=newlist![index].toString();
                      //Navigator.pop(context, newlist![index].toString().toLowerCase());
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: (){
          Navigator.pop(context, myController.text);
        },
      ),
    );
  }
}
