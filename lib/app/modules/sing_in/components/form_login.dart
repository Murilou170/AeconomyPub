import 'package:aeconomy/app/modules/sing_in/usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../home/pages/home.dart';
import '../../register/pages/register_page.dart';

class FormLogin extends StatefulWidget {
  FormLogin({Key? key}) : super(key: key);

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
   TextEditingController _controllerEmail = TextEditingController();

  TextEditingController _controllerSenha = TextEditingController();

  String _mensagemErro = "";

 _validarCampos() {
    String email = _controllerEmail.text.trim();
    String senha = _controllerSenha.text;

    if (email.isNotEmpty && email.contains("@")) {
      if (senha.isNotEmpty) {
        setState(() {
          _mensagemErro = "";
        });

        String nome = "";
        
        String cep = "";
        Usuario usuario = Usuario(email, senha, nome, cep);
        usuario.email = email;
        usuario.senha = senha;

        _logarUsuario(usuario);
      } else {
        setState(() {
          _mensagemErro = "Preencha a senha!";
        });
      }
    } else {
      setState(() {
        _mensagemErro = "Preencha o E-mail corretamente";
      });
    }
  }

  _logarUsuario(Usuario usuario) {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth
        .signInWithEmailAndPassword(
            email: usuario.email, password: usuario.senha)
        .then((currentUser) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }).catchError((error) {
      print("erro app: " + error.toString());
      setState(() {
        _mensagemErro =
            "Erro ao autenticar usuário, verifique o e-mail e senha e tente novamente!";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Image.asset(
                'assets/images/logos/sublogo_aeconomy.jpeg',
                width: 250,
                height: 200,
              ),
              
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextField(
                //designar o controller para o email
                controller: _controllerEmail,
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                //customização
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                  labelText: "E-mail",
                  hintText: "User@email.com",
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 8, 10, 10),
              child: TextField(
                //designar controller para a senha
                controller: _controllerSenha,
                autofocus: true,
                keyboardType: TextInputType.text,
                //customização
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                  labelText: "Senha",
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                ),
                obscureText: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(100, 16, 100, 16),
              child: ElevatedButton(
                child: Text(
                  "Entrar",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  _validarCampos();
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xffFF1717),
                    padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    )),
              ),
            ),
            Center(
              child: GestureDetector(
                child: Text(
                  "Não tem conta? Cadastre-se",
                  style: TextStyle(color: Color(0xffFF1717), fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Center(
                child: Text(
                  _mensagemErro,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            )
          ],
        );
  }
}
