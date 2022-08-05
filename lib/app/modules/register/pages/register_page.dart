import 'package:aeconomy/app/modules/register/components/register_forms.dart';
import 'package:aeconomy/shared_components/appbars/OutsideAppBar.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          // decoration: BoxDecoration(
          //     gradient: LinearGradient(colors: [
          //   Color.fromRGBO(255, 50, 0, 0.5),
          //   Color.fromRGBO(255, 188, 117, 0.5)
          // ])),
          height: 1000,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 45,
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                            ),
                          ),
                          SizedBox(height: 25),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            child: Center(
                              child: Text(
                                'Registre-se para ficar por dentro das melhores ofertas',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 50),
                          RegisterForms(),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
