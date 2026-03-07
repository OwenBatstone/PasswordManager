import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget{ 
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
  
}


class _LoginPageState extends State<LoginPage> { 


final GlobalKey<FormState> formKey = GlobalKey<FormState>();
final TextEditingController emailController = TextEditingController(); 
final TextEditingController passwordController = TextEditingController();

@override
Widget build(BuildContext context) { 
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blue,
      title: const Text('Login')
    ),
    body : Padding(
      padding: EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email"
              ),
              //Validator to check for something
              validator: (value) {
                if(value == null || value.isEmpty)
                {
                  return "Enter Email";
                }
                return null;  
              },
              
            ),
            const SizedBox( 
              height : 20
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password"
                ),
                validator: (value) { 
                  if( value == null || value.isEmpty){ 
                    return "Enter Password";
                  }
                  return null;
                }
                ),
                const SizedBox(height: 20), 
                ElevatedButton(onPressed: () {
                  if( formKey.currentState!.validate()){ 
                    //TODO CREATE new class with login logic
                    // Steps planned to implement
                    // hash then encrypt then compare to database 
                    // could aso hash email if we really want?
                    print('Email:${emailController.text}');
                  }
                }, 
                child: const Text('Login'),
                )
          ],
        ),
      ),
      )
  );

}


}