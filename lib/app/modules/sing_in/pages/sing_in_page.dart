import 'package:flutter/material.dart';

class SingInPage extends StatelessWidget {
  const SingInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.fill,
        child: Image.asset(
          'assets/images/cart_login_2_page.jpg',
        ),
      ),
    );
  }
}
