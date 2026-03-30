import 'package:flutter/material.dart';
import '../supabase_functions/insert_credentials.dart';

class AddNewSites extends StatefulWidget {
  final VoidCallback? onSaved;
  const AddNewSites({super.key, this.onSaved});

  @override
  State<AddNewSites> createState() => _AddNewSitesState();
}

class _AddNewSitesState extends State<AddNewSites> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController websiteName = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    websiteName.dispose();
    username.dispose();
    password.dispose();
    super.dispose();
  }

  Future<void> savePassword() async {
    if (!formKey.currentState!.validate()) return;

    try {
      await insertPassword(
        website: websiteName.text.trim(),
        username: username.text.trim(),
        password: password.text,
      );

      if (!context.mounted) return;

      websiteName.clear();
      username.clear();
      password.clear();

      widget.onSaved?.call();

    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving password: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Add Password"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: websiteName,
                decoration: const InputDecoration(labelText: "Enter Website Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Enter Website";
                  return null;
                },
              ),
              TextFormField(
                controller: username,
                decoration: const InputDecoration(labelText: "Enter Username"),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Enter Username";
                  return null;
                },
              ),
              TextFormField(
                controller: password,
                obscureText: true,   
                decoration: const InputDecoration(labelText: "Enter Password"),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Enter Password";
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: savePassword,
                child: const Text("Save Password"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}