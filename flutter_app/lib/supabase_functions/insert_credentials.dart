import 'package:supabase_flutter/supabase_flutter.dart';
import '../data_classes/password_entry.dart';

Future<PasswordEntry> insertPassword({
  required String website,
  required String username,
  required String password,
}) async {
  final supabase = Supabase.instance.client;
  final userId = supabase.auth.currentUser!.id;

  final response = await supabase.from('passwords').insert({
    'user_id': userId,
    'service_name': website,
    'username': username,
    'password': password,
  }).select().single();

  return PasswordEntry.fromMap(response);
}