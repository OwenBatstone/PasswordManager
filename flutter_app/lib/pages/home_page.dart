import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../data_classes/password_entry.dart';
import '../widgets/password_card.dart';
import 'add_new_sites.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PasswordEntry> passwords = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPasswords();
  }


  Future<void> fetchPasswords() async {
    try {
      final supabase = Supabase.instance.client;
      final userId = supabase.auth.currentUser!.id;

      final response = await supabase
          .from('passwords')
          .select()
          .eq('user_id', userId);

      setState(() {
        passwords = (response as List)
            .map((e) => PasswordEntry.fromMap(e))
            .toList();
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error fetching passwords: $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Password Manager"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : passwords.isEmpty
              ? const Center(child: Text("No passwords entered. Try adding one!"))
              : ListView.builder(
                  itemCount: passwords.length,
                  itemBuilder: (context, index) {
                    return PasswordCard(entry: passwords[index]);
                  },
                ), 
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newEntry = await Navigator.push<PasswordEntry>(
            context,
            MaterialPageRoute(builder: (context) => const AddNewSites()),
          );
          if (newEntry != null) {
            setState(() => passwords.add(newEntry));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
} 