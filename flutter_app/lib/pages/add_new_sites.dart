// Implement page to add new cards 
// Commented out button on navbar will be implemented here


import 'package:flutter/material.dart';

class AddNewSites extends StatefulWidget {
  const AddNewSites({super.key});

  @override
  State<AddNewSites> createState() => _AddNewSitesState();
}

class _AddNewSitesState extends State<AddNewSites> {
  int currentIndex = 0; 
  
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController websiteName = TextEditingController(); 
  final TextEditingController username= TextEditingController();
  final TextEditingController password = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar( 
      backgroundColor: Colors.blue,
      title: const Text("Add Password"),
    ),
    body:
    Container( 
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(10), 
      child: Form(
        key: formKey, 
         child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
              TextFormField(
                controller: websiteName,
                decoration: const InputDecoration(
                  labelText: "Enter Website Name"
                ),
                validator: (value){  // add verification rules here
                  if (value == null || value.isEmpty)
                  {
                    return "Enter Webstite"; 
                  }
                  return null;
                },
              ), 
              TextFormField(
                controller: username,
                decoration: const InputDecoration(
                  labelText: "Enter Username"
                ),
                validator: (value){  //add verification rules here
                  if (value == null || value.isEmpty)
                  {
                    return "Enter UserName"; 
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: password,
                decoration: const InputDecoration(
                  labelText: "Enter Password"
                ),
                validator: (value){  // add verification rules here
                  if (value == null || value.isEmpty)
                  {
                    return "Enter password"; 
                  }
                  return null;
                },
              ), 

            ],
         ),
        ),
      ),

    );
  }
}