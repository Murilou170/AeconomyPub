import 'package:flutter/material.dart';

class Proximidades extends StatefulWidget {
  const Proximidades({Key? key}) : super(key: key);

  @override
  State<Proximidades> createState() => _ProximidadesState();
}

class _ProximidadesState extends State<Proximidades> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Mapa",
        style: TextStyle(fontSize: 25
        ),
      ),
    );
  }
}
