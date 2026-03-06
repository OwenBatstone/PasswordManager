import 'package:flutter/material.dart';
import '../data_classes/password_entry.dart';
import '../widgets/password_card.dart';


class HomePage extends StatelessWidget{ 
  const HomePage({super.key});

  @override
  Widget build(BuildContext context){ 
    final List<PasswordEntry> passwords = [
      PasswordEntry(website: "Google", password: "abc123"),
      PasswordEntry(website: "Amazon", password: "qwerty!"),
      PasswordEntry(website: "GitHub", password: "Dev@2024"),
    ];
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Password Manager App'),
        ),
        body: ListView.builder(
          itemCount: passwords.length, 
          itemBuilder:(context, index) {
            return PasswordCard(entry: passwords[index]);
          }
        ),
      );

  }
}


