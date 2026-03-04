import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp()); 
}

class PasswordEntry {
  final String website;
  final String password;

  PasswordEntry({
    required this.website,
    required this.password,
  });
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //test Passwords 
  final List<PasswordEntry> passwords = [
      PasswordEntry(website: "Google", password: "abc123"),
      PasswordEntry(website: "Amazon", password: "qwerty!"),
      PasswordEntry(website: "GitHub", password: "Dev@2024"),
    ];


    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Password Manager App'),
        ),
        body: ListView.builder(
          itemCount: passwords.length, 
          itemBuilder:(context, index) {
            return PasswordCard(entry: passwords[index]);
          }
        ) 
        ),
      );
  }
}

class PasswordCard extends StatefulWidget{ 
  final PasswordEntry entry; 

  const PasswordCard({super.key, required this.entry});
  @override
  State<PasswordCard> createState() =>_PasswordCardState();  

}

class _PasswordCardState extends State<PasswordCard>{
  bool passwordVisable = false; 
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal : 16, vertical: 10), 
      child: Card(
        color: Colors.blueAccent, //Card Colour
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), 
          ),
          child: Container(
            height: 120,
            width: double.infinity, 
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.entry.website, 
                  style: const TextStyle(
                    fontSize : 22, 
                    color: Colors.white
                  )
                  ),
                  GestureDetector(
                    onTap: () { 
                      setState(() {
                        passwordVisable = !passwordVisable;
                      });
                    },
                    child: Text(
                      passwordVisable 
                    ? widget.entry.password
                    :"***********",
                    style:const TextStyle(
                    fontSize : 22, 
                    color: Colors.white),
                  ),
            )
              ]
          )
        )
        )
      ) 
    ;
  }
}