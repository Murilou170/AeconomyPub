import 'package:aeconomy/app/modules/sing_in/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  _deslogarUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
    Navigator.pop(context);
    //Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text("Customização do perfil"),
          ),
          Padding(
              padding: EdgeInsets.all(16),
              child: ElevatedButton(
                child: Text(
                  "Deslogar",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  _deslogarUsuario();
                },
              ))
        ],
      ),
    )));
  }
}
