import 'package:supabase_flutter/supabase_flutter.dart';


Future<void> verifyOTP(String email, String optController) async {
  final supabase = Supabase.instance.client; 
  // ignore: unused_local_variable
  await supabase.auth.verifyOTP(
  email: email,
  token: optController,
  type : OtpType.signup,
 );
} 



