import 'package:flutter/material.dart';

class OutsideAppBar extends StatelessWidget implements PreferredSizeWidget {
  OutsideAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xffFF1717),
      elevation: 0,
      title: Text("Registre-se",
      style: TextStyle(
        fontSize: 40
      ),),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(150);
}
