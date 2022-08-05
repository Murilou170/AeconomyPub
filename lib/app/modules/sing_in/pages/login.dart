import 'package:aeconomy/app/modules/home/pages/home.dart';
import 'package:aeconomy/app/modules/register/pages/register_page.dart';
import 'package:aeconomy/app/modules/sing_in/usuario.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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

  Future _verificarUsuarioLogado() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  @override
  void initState() {
    _verificarUsuarioLogado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
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
                    controller: _controllerEmail,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
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
                    controller: _controllerSenha,
                    autofocus: true,
                    keyboardType: TextInputType.text,
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
                SizedBox(height: 30),
                Container(
                  
                  // margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Container(
                        width: 350,
                        height: 40,
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
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 350,
                        height: 40,
                        child: ElevatedButton(
                          child: Text(
                            "Não tem conta?",
                            style:
                                TextStyle(color: Colors.grey[800], fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          _mensagemErro,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
