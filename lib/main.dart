import 'package:flutter/material.dart';
import 'pages/homePage.dart';
import 'pages/sideMenu.dart';
import 'pages/entry_point.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'File picker demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Entry_Point(),
    );
  }
}
