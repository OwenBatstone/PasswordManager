import 'package:flutter/material.dart';
import '../pages/nav_bar.dart';
import '../supabase_functions/initlilize_supabase.dart';
void main() async{
  await initSupabase();
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






