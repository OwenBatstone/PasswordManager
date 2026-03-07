import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> initSupabase() async { 
  WidgetsFlutterBinding.ensureInitialized(); 
  await Supabase.initialize(
    url: "https://mdmwpmybnbsymihsdecp.supabase.co",
    anonKey: "sb_publishable_UASXBZoqDHapUQuwoYqTNg_gVimXS40"
  ); 
}
