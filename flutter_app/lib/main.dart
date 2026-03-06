import 'package:flutter/material.dart';
import '../pages/nav_bar.dart';

void main(){
  runApp(const MyApp()); 
}






class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //test   Passwords 
    return const MaterialApp(
      home:NavBar(),
    );
  }
}






