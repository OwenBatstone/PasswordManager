import 'package:flutter/material.dart';
import 'package:flutter_app/login/sign_in.dart';
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
bool _isLoading = false; 


Future<void> _loginStates() async { 
  if (!formKey.currentState!.validate()) return; 

  setState(() => _isLoading = true);
  try{
    final email = emailController.text.trim(); 
    final password = passwordController.text;
    
    await signInWithEmail(email, password);

    if (mounted) { 
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NavBar()),
        );
      }
    } catch (e) { 
      if (mounted) { 
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: ${e.toString()}')), 
        );
      }
    } finally { 
      if (mounted) setState(() => _isLoading = false);
    }

  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }



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
                ElevatedButton(onPressed:_isLoading ? null : _loginStates,
                child: _isLoading 
                ?const SizedBox(
                  height: 20, 
                  width: 20, 
                  child : CircularProgressIndicator(strokeWidth: 2 ),
                  )
                  : const Text("Login"),
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