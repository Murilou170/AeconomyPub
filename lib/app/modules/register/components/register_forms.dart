import 'package:aeconomy/app/modules/home/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aeconomy/app/modules/sing_in/usuario.dart';

class RegisterForms extends StatefulWidget {
  const RegisterForms({Key? key}) : super(key: key);

  @override
  _RegisterFormsState createState() => _RegisterFormsState();
}

class _RegisterFormsState extends State<RegisterForms> {
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllercep = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _mensagemErro = "";

  _validarCampos() {
    String nome = _controllerNome.text;
    String cep = _controllercep.text;
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    if (nome.isNotEmpty) {
      if (cep.isNotEmpty && cep.length == 9) {
        if (email.isNotEmpty && email.contains("@")) {
          if (senha.isNotEmpty && senha.length > 6) {
            setState(() {
              _mensagemErro = "";
            });

            Usuario usuario = Usuario(nome, cep, email, senha);
            usuario.nome = nome;

            usuario.cep = cep;
            usuario.email = email;
            usuario.senha = senha;
            _cadastrarUsuario(usuario);
          } else {
            setState(() {
              _mensagemErro =
                  "Preencha a senha corretamente com mais de 6 caracteres";
            });
          }
        } else {
          setState(() {
            _mensagemErro = "Preencha o E-mail corretamente utilizando @";
          });
        }
      } else {
        setState(() {
          _mensagemErro =
              "Preencha o campo de CEP com um valor válido ex: 55641-715";
        });
      }
    } else {
      setState(() {
        _mensagemErro = "Preencha seu nome";
      });
    }
  }

  _cadastrarUsuario(Usuario usuario) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    FirebaseAuth auth = FirebaseAuth.instance;

    auth
        .createUserWithEmailAndPassword(
      email: usuario.email,
      password: usuario.senha,
    )
        .then((firebaseUser) {
      FirebaseFirestore.instance
          .collection("Usuários")
          .doc(firebaseUser.user!.uid)
          .set(usuario.toMap());

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    }).catchError((error) {
      setState(() {
        _mensagemErro =
            "Erro ao cadastrar usuário, verifique os campos e tente novamente";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _controllerNome,
            autofocus: true,
            keyboardType: TextInputType.text,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
              hintText: "Nome Completo",
              filled: true,
              fillColor: Colors.grey[100],
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _controllercep,
            autofocus: true,
            keyboardType: TextInputType.streetAddress,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
              hintText: "CEP",
              filled: true,
              fillColor: Colors.grey[100],
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _controllerEmail,
            autofocus: true,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
              hintText: "E-mail",
              filled: true,
              fillColor: Colors.grey[100],
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _controllerSenha,
            autofocus: true,
            keyboardType: TextInputType.text,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
              hintText: "Senha",
              filled: true,
              fillColor: Colors.grey[100],
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            obscureText: true,
          ),
          SizedBox(height: 40),
          Center(
            child: Container(
              width: 350,
              height: 40,
              child: ElevatedButton(
                child: Text(
                  "Cadastrar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  _validarCampos();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffFF1717),
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
             "${_mensagemErro}",
              style: TextStyle(color: Colors.redAccent, fontSize: 25),
            ),
          )
        ],
      ),
    );
  }
}
