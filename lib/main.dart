import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app/modules/sing_in/pages/login.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    home: Login(),
    theme: ThemeData(
      primaryColor: Color(0xffFF1717),

    ),
    debugShowCheckedModeBanner: false,
  ));

}