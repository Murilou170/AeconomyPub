import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Home.dart';
import 'model/Usuario.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  //controladores

  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerSobrenome = TextEditingController();
  TextEditingController _controllercep = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _mensagemErro = "";

  _validarCampos() {
    //Recupera dados dos campos

    String nome = _controllerNome.text;
    String sobrenome = _controllerSobrenome.text;
    String cep = _controllercep.text;
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    if (nome.isNotEmpty) {
      if (sobrenome.isNotEmpty) {
        if (cep.isNotEmpty && cep.length == 9) {
          if (email.isNotEmpty && email.contains("@")) {
            if (senha.isNotEmpty && senha.length > 6) {
              setState(() {
                _mensagemErro = "";
              });

              Usuario usuario = Usuario(nome, sobrenome, cep, email, senha);
              usuario.nome = nome;
              usuario.sobrenome = sobrenome;
              usuario.cep = cep;
              usuario.email = email;
              usuario.senha = senha;
              _cadastrarUsuario(usuario);


            }else{
              setState(() {
                _mensagemErro = "Preencha a senha corretamente com mais de 6 caracteres";
              });
            }
          }else{
            setState(() {
              _mensagemErro = "Preencha o E-mail corretamente utilizando @";
            });
          }
        }else{
          setState(() {
            _mensagemErro = "Preencha o campo de CEP com um valor válido ex: 55641-715";
          });
        }
      }else{
        setState(() {
          _mensagemErro = "Preencha seu sobrenome";
        });
      }
    }else{
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
          .doc(firebaseUser.user!.uid) //dúvida no "!"
          .set(usuario.toMap());
      
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
    }).catchError((error){
      setState(() {
        _mensagemErro = "Erro ao cadastrar usuário, verifique os campos e tente novamente";
      });
         });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffFF1717),
        title: Text("Cadastre-se"),
      ),
      body: Container(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32, left: 5, right: 5),
              child: TextField(
                controller: _controllerNome,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    labelText: "Nome",
                    hintText: "Jorge",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32, left: 5, right: 5),
              child: TextField(
                  controller: _controllerSobrenome,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    labelText: "Sobrenome",
                    hintText: "Silva",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32, left: 5, right: 5),
              child: TextField(
                  controller: _controllercep,
                  autofocus: true,
                  keyboardType: TextInputType.streetAddress,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    labelText: "CEP",
                    hintText: "xxxxx-xxx",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32, left: 5, right: 5),
              child: TextField(
                  controller: _controllerEmail,
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    labelText: "E-mail",
                    hintText: "user@email.com",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32, left: 5, right: 5),
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
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(100, 16, 100, 16),
              child: ElevatedButton(
                child: Text(
                  "Cadastrar",
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
              child: Text(
                _mensagemErro,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            )
          ],
        )),
      ),
    );
  }
}
