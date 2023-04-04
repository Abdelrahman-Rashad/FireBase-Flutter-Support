import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_support/screens/auth/signUp.dart';
import 'package:flutter/material.dart';

import '../../component/auth/buttonWidget.dart';
import '../../component/auth/textFormFieldWidget.dart';
import '../../core/data_provider/remote/fireBaseHelper.dart';
import '../home/home.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                          "Sign In",
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
                          "Welcome Back",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
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

                      // TODO: create SignInParamter
                      ButtonWidget(text: "Sign In", onTop: SignInParameter),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "To create your account Please,",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                              },
                              child: const Text("Sign Up",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.deepOrange)))
                        ],
                      )
                    ],
                  ),
                ))),
      ),
    );
  }

  Future<void> SignInParameter() async {
    if (formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
      FireBaseHelper()
          .SignIn(emailController.text.toString(),
              passwordController.text.toString())
          .then((value) {
        if (value is User) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Hello ${value.displayName}")));
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
