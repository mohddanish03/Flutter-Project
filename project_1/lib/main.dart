import 'package:flutter/material.dart';
import 'package:project_1/HomeMenu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(primaryColor: Color(0xFFFEDBD0)),
      home: HomeMenu(),
    );
  }
}
