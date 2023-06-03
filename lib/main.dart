import 'package:flutter/material.dart';
import 'package:tpm/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsi TPM',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginPage(),
    );
  }
}