import 'package:flutter/material.dart';
import '../login/sign_up.dart';
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
              ElevatedButton(
                onPressed: () async {
                if (formKey.currentState!.validate()) {
                  try {
                  await signUpWithEmail(
                    emailController.text.trim(),
                    passwordController.text,
                  );
                if (!context.mounted) return;
                // Success — send them to login
                Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false,
                );
                } catch (e) {
                if (!context.mounted) return;
                  // Show error to user
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(e.toString())),
                );
              }
              }
              },
              child: const Text("Sign Up"),
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