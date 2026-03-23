import 'package:supabase_flutter/supabase_flutter.dart';
import '../data_classes/password_entry.dart';
import 'aes_encryption.dart';
import 'session.dart';

Future<PasswordEntry> insertPassword({
  required String website,
  required String username,
  required String password,
}) async {
  final supabase = Supabase.instance.client;
  final userId = supabase.auth.currentUser!.id;
  final userPasswordHash = Session.passwordHash!;

  final response = await supabase.from('passwords').insert({
    'user_id': userId,
    'service_name': website,
    'username': username,
    'password': aesEncrypt(password, createAesKey(userPasswordHash, userId, website)), //Not sure if this will let me change it this far down, may have to move the code up and add some variables
  }).select().single();

  return PasswordEntry.fromMap(response);
}