import 'package:flutter/material.dart';

import 'ekrany/login.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Logowanie oraz Rejestracja',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: LoginForm(),
    );
  }
}
