import 'package:flutter/material.dart';
import 'package:flutter_app/pages/nav_bar.dart';
import 'package:flutter_app/pages/signup_page.dart';



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
                //elevated button for submit information
                ElevatedButton(onPressed: () {
                  if( formKey.currentState!.validate()){ 
                    //add   new class with login logic
                    // Steps planned to implement
                    // hash then encrypt then compare to database 
                    // could aso hash email if we really want?
                    
                  }
                  Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const NavBar()
                  ));
                }, 
                child: const Text('Login'),
                ),
                const SizedBox(height: 20), 
                ElevatedButton(onPressed: (){  
                 Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupPage()
                  ));
                  
                },
                child: const Text("Sign up"),
                
                )
          ],
        ),
      ),
      )
  );

}


}