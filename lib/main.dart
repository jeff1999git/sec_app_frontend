import 'package:flutter/material.dart';
import 'package:security_app/Pages/admin_login.dart';

void main(){
  runApp(HomePage());
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AdminLogin(),

    );
  }
}

