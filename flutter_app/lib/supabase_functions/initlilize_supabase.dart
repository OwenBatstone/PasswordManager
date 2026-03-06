import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> initSupabase() async { 
  WidgetsFlutterBinding.ensureInitialized(); 
  await Supabase.initialize(
    url: "https://aczgmldesckounulqnyl.supabase.co ",
    anonKey: "sb_publishable_pFEjwAtnpV-DoyFCFsIRxw_rZa5k0cg"
  ); 
}
