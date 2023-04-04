import 'package:firebase_flutter_support/core/data_provider/remote/fireBaseHelper.dart';
import 'package:firebase_flutter_support/screens/auth/signIn.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Home"),
          actions: [
            IconButton(onPressed: () {
              FireBaseHelper().SignOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> SignIn()));
            }, icon: const Icon(Icons.logout))
          ]),
      body: const Center(
          child: Text(
        "Home",
        style: TextStyle(fontSize: 25),
      )),
    );
  }
}
