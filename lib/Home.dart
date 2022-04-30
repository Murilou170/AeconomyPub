import 'package:aeconomy/telas/Perfil.dart';
import 'package:flutter/material.dart';
import 'package:aeconomy/telas/Início.dart';
import 'package:aeconomy/telas/Proximidades.dart';
import 'package:aeconomy/telas/Busca.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;


  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(),
      Proximidades(),
      Busca(),
      Perfil(),

    ];

    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context){
          return IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icon(Icons.shopping_cart),
          );
        }),
        backgroundColor: Color(0xffFF1717),
        centerTitle: true,
        title: Text("Aeconomy"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(26),
              //child:  Icon(Icons.account_circle),

              child: Text("Meu carrinho:",
                style: TextStyle(
                  color: Color(0xffFF1717),
                  fontSize: 45,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ],

        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Color(0xffFF1717),
        items: [
          BottomNavigationBarItem(
            label: 'Início',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Proximidades',
            icon: Icon(Icons.location_searching_sharp),
          ),
          BottomNavigationBarItem(
            label: 'Catálogo',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'Perfil',
            icon: Icon(Icons.account_circle),
          )
        ],
      ),
    );
  }
}