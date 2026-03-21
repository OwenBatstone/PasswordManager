import 'package:supabase_flutter/supabase_flutter.dart'; 

Future <void> deletePassword({required int id}) async {
  final supabase = Supabase.instance.client;

  await supabase
  .from('passwords')
  .delete()
  .eq('id',id); //delete where id equals user id

} 