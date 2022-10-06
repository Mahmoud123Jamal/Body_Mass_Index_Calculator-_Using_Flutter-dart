import 'package:flutter/material.dart';
import 'Home.dart';


void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        
        primarySwatch: Colors.teal,
        canvasColor: Colors.black,
        textTheme: const TextTheme(
           headline1: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.w800,
           color: Colors.white,
           ),
          headline2: TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.w400,
           color: Colors.black,
         ),
        ),
        iconTheme: const IconThemeData(color: Colors.white ),
      ),
      home: const MyHomePage(),
    );
  }
}
