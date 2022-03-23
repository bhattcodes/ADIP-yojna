// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:user_app/screens/dashbord.dart';
import 'package:user_app/utils/colors.dart';
import 'package:user_app/widgets/check_box.dart';

import '../resources/auth_methods.dart';
import '../utils/utils.dart';
import '../widgets/text_field_input.dart';

class DocsInputPage extends StatefulWidget {
  const DocsInputPage({Key? key}) : super(key: key);

  @override
  State<DocsInputPage> createState() => _DocsInputPageState();
}

class _DocsInputPageState extends State<DocsInputPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _udidController = TextEditingController();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _mobileContoller = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _stateController = TextEditingController();
    bool _isLoading = false;

    @override
    void dispose() {
      super.dispose();
      _udidController.dispose();
      _nameController.dispose();
      _mobileContoller.dispose();
      _emailController.dispose();
      _stateController.dispose();
    }

    void signUpUser() async {
      setState(() {
        _isLoading = true;
      });
      String res = await AuthMethods().signUpUser(
        udid: _udidController.text,
        name: _nameController.text,
        mobile: _mobileContoller.text,
        email: _emailController.text,
        state: _stateController.text,
      );
      print(res);

      setState(() {
        _isLoading = false;
      });

      if (res != 'success') {
        showSnackBar(res, context);
      } else {
        // after success signup navigate to our responsive layouts
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Dashboard(),
          ),
        );
      }
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xfffff3e9),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/form.png',
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.center,
                child: Text("Upload Documents",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.brown[700],
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: const EdgeInsets.all(40),
                child: Center(
                  child: Column(
                    children: [
                      TextFieldInput(
                        textEditingController: _udidController,
                        hintText: 'Udid',
                        textInputType: TextInputType.text,
                      ),
                      TextFieldInput(
                        textEditingController: _nameController,
                        hintText: 'Name',
                        textInputType: TextInputType.text,
                      ),
                      TextFieldInput(
                        textEditingController: _mobileContoller,
                        hintText: 'Mobile',
                        textInputType: TextInputType.text,
                      ),
                      TextFieldInput(
                        textEditingController: _stateController,
                        hintText: 'State',
                        textInputType: TextInputType.text,
                      ),
                      TextFieldInput(
                        textEditingController: _emailController,
                        hintText: 'Email',
                        textInputType: TextInputType.text,
                      ),
                      Row(children: [
                        Align(
                          child: CheckBox(),
                          alignment: Alignment.centerLeft,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Text("Agree with Agenda"),
                        )
                      ]),
                      InkWell(
                        onTap: signUpUser,
                        child: Container(
                          child: _isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: primaryColor,
                                  ),
                                )
                              : const Text('add details'),
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                              color: Color(0xffFDA758)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
