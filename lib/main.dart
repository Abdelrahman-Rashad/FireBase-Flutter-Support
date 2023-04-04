import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_flutter_support/screens/auth/signIn.dart';
import 'package:firebase_flutter_support/screens/home/home.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget start() {
    if (FirebaseAuth.instance.currentUser != null) {
      return Home();
    } else {
      return SignIn();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: start(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.deepOrange,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.deepOrange,
          )),
    );
  }
}
