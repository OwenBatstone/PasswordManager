import 'package:flutter/material.dart';
import 'package:flutter_app/pages/login_page.dart';

import '../supabase_functions/initalize_supabase.dart';
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
      home:LoginPage(),
    );
  }
}






