import 'package:flutter/material.dart';
import 'file:///C:/Users/USER/Desktop/470/Project/News360.-master/lib/view/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,

      ),
      home: Home(),
    );
  }
}


