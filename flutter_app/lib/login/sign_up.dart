import 'package:supabase_flutter/supabase_flutter.dart';


Future<void> signUpWithEmail(String email, String password) async {
  final supabase = Supabase.instance.client; 
  // ignore: unused_local_variable
  await supabase.auth.signUp(
  email: email,
  password: password,
  emailRedirectTo: 'io.supabase.flutter_app://login-callback',
 );
} 



