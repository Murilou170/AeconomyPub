import 'package:aeconomy/app/modules/sing_in/components/form_login.dart';
import 'package:flutter/material.dart';

class SingInPage extends StatelessWidget {
  const SingInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(255, 50, 0, 0.5),
              Color.fromRGBO(255, 188, 117, 0.5)
            ])),
          ),
          Container(
            width: double.infinity,
            child: FormLogin(),
          )
        ],
      ),
    );
  }
}
