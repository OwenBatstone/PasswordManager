import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{ 
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
  
}


class _LoginPageState extends State<LoginPage> { 

final TextEditingController emailController = TextEditingController(); 
final TextEditingController passwordController = TextEditingController();

@override
Widget build(BuildContext context) { 
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blue,
      title: const Text('Login')
    ),
  );

}


}