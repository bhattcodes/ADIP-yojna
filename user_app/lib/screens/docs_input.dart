// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:user_app/screens/dashbord.dart';
import 'package:user_app/utils/colors.dart';

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
                      TextFieldInput(
                        textEditingController: _udidController,
                        hintText: 'Enter your udid',
                        textInputType: TextInputType.text,
                      ),
                      TextFieldInput(
                        textEditingController: _nameController,
                        hintText: 'Enter your Name',
                        textInputType: TextInputType.text,
                      ),
                      TextFieldInput(
                        textEditingController: _mobileContoller,
                        hintText: 'Enter your Mobile',
                        textInputType: TextInputType.text,
                      ),
                      TextFieldInput(
                        textEditingController: _stateController,
                        hintText: 'Enter your State',
                        textInputType: TextInputType.text,
                      ),
                      TextFieldInput(
                        textEditingController: _emailController,
                        hintText: 'Enter your Email',
                        textInputType: TextInputType.text,
                      ),
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
                              color: blueColor),
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
