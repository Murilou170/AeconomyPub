import 'package:flutter/material.dart';

class Busca extends StatefulWidget {
  const Busca({Key? key}) : super(key: key);

  @override
  State<Busca> createState() => _BuscaState();
}

class _BuscaState extends State<Busca> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Pesquisa de preço",
        style: TextStyle(fontSize: 25
        ),
      ),
    );
  }
}
