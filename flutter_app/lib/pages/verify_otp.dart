import 'package:flutter/material.dart';
import 'package:flutter_app/login/otp.dart';
import 'package:flutter_app/pages/login_page.dart';

class VerifyOtp extends StatefulWidget {
  
  final String email; 
  const VerifyOtp({super.key, required this.email});

  @override
  State<VerifyOtp> createState() => _SignupPageState();
}

class _SignupPageState extends State<VerifyOtp> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController(); 

  @override
  void dispose() {
    otpController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Verification Code"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "A verification Code was sent to ${widget.email}", 
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: otpController,
                decoration: const InputDecoration(
                  labelText: "8 Digit OTP Code",
                ),
                keyboardType: TextInputType.number, 
                maxLength: 9,                      
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter OTP Code";
                  }
                  if (value.length != 8) {         
                    return "OTP must be 8 digits";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      await verifyOTP(
                        widget.email,          
                        otpController.text.trim(),
                      );
                      if (!context.mounted) return;
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                        (route) => false,
                      );
                    } catch (e) {
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toString())),
                      );
                    }
                  }
                },
                child: const Text("Verify"),  
              ),
            ],
          ),
        ),
      ),
    );
  }
}