import 'package:flutter/material.dart';
import 'package:my_project/splashScreen.dart';
import 'package:my_project/services/api.dart';

void main() {
  Api.getAllUsers();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Red Crossroads',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: splashScreen(),
    );
  }
}
