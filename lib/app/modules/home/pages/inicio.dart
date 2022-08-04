import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                    'assets/images/logos/sublogo_aeconomy.jpeg',
                    width: 300,
                    height: 300,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Text("* Melhores ofertas")),
                Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Text("* Propagandas")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
