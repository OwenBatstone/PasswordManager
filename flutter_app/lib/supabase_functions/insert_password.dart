
import 'package:flutter_app/supabase_functions/initalize_supabase.dart';
import '../data_classes/password_entry.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


// this function would only be used to insert the credentials to the database
// this is not how we would do it placeholder
Future<String> insertPassword(PasswordEntry credentials) async{ 
  initSupabase();
  final supabase = Supabase.instance.client; 
  try
  {  
      final response = await supabase 
      .from("passwords")
      .insert("");
      return response; 

  } on PostgrestException catch (error) { 
      return "Error fetching data: ${error.message}";
    }
    catch (error){ 
      return("Error with supabase: $error");
      
    }
}