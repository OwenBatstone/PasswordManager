import 'package:flutter/material.dart';

import 'package:flutter_app/pages/login_page.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPage(); 

}




class _SignupPage extends State<SignupPage> {
  int currentIndex = 0; 
  // contorllers for forms
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController(); 
  final TextEditingController passwordController = TextEditingController(); 


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Sign Up")
      ), 
       body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email"
                ),
                validator: (value){  // add verification rules here
                  if (value == null || value.isEmpty)
                  {
                    return "Enter Email"; 
                  }
                  return null;
                },
              ), 
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: "Password"
                ),
                validator: (value){  //add verification rules here
                  if (value == null || value.isEmpty)
                  {
                    return "Enter Password"; 
                  }
                  return null;
                },
              ),
              const SizedBox( // sized box for elevated button for submit
                height: 20,
              ), 
              ElevatedButton(onPressed: () {
                  if(formKey.currentState!.validate()){ 
                    // ADD Signup Logic
                 Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                   (route) => false,
                );
                  } 
              }, 
              child: Text("SignUp")
              ), 
              const SizedBox(
                height: 20
              ), 
              ElevatedButton(onPressed: () { 
                Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                   (route) => false,
                );



              },
              child: Text("Login") 
              ),
            ],
          ),
          
          ),
      )
    );
    



    
  }
} 