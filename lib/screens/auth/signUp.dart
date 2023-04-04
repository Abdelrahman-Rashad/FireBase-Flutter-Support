import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_support/core/data_provider/remote/fireBaseHelper.dart';
import 'package:firebase_flutter_support/screens/home/home.dart';
import 'package:flutter/material.dart';

import '../../component/auth/buttonWidget.dart';
import '../../component/auth/textFormFieldWidget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Create your account",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    TextFormFieldWidget(
                      textController: userNameController,
                      text: 'User Name',
                      errorText: 'Please enter your name',
                    ),
                    TextFormFieldWidget(
                      textController: emailController,
                      text: 'Email',
                      errorText: 'Please enter your email',
                    ),
                    TextFormFieldWidget(
                      textController: passwordController,
                      text: 'Password',
                      errorText: 'Please enter your password',
                    ),
                    // TODO: create SignUpParamter
                    ButtonWidget(text: "Sign Up", onTop: SignUpParameter)
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> SignUpParameter() async {
    if (formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
      FireBaseHelper()
          .SignUp(
              emailController.text.toString(),
              passwordController.text.toString(),
              userNameController.text.toString())
          .then((value) {
        if (value is User) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
        } else if (value is String) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value)));
          Navigator.pop(context);
        }
      });
    }
  }
}
