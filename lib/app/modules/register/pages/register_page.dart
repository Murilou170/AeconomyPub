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
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: 
            [
              Color.fromRGBO(215,117,255,0.5),
            Color.fromRGBO(255,188,117,0.9)
            ]
            )
          ),
          height: 1000,
          
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
                child: Container(
                  decoration: new BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      )),
                  height: 800,
                  width: MediaQuery.of(context).size.width,
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
                            color: Colors.white,
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
                                color: Colors.white,
                                fontSize: 40,
                              ),
                            ),
                            SizedBox(height: 25),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              child: Text(
                                'Registre-se para ficar por dentro das melhores ofertas',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
