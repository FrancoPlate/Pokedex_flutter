import 'package:flutter/material.dart';
import 'package:flutter_pokemon/prueba.dart';
import 'package:get/get.dart';
import 'package:flutter_pokemon/pages/DetailsScreen.dart';
import 'package:flutter_pokemon/pages/HomeScreen.dart';

void main() {
  runApp(MyApp()); 
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}



class _MyAppState extends State<MyApp>{

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }

}

