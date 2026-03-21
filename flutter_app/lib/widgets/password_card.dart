import 'package:flutter/material.dart';
import '../data_classes/password_entry.dart'; 

class PasswordCard extends StatefulWidget{ 
  final PasswordEntry entry;
  final VoidCallback? onDelete;

  const PasswordCard({super.key, required this.entry, this.onDelete});
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
        color: Colors.blueAccent,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), 
        ),
        child: Container(
          height: 180,
          width: double.infinity, 
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.entry.website,
                    style: const TextStyle(
                      fontSize: 30, 
                      color: Colors.white
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.white),
                    onPressed: widget.onDelete,
                  ),
                ],
              ),
              Text(
                widget.entry.username, 
                style: const TextStyle(
                  fontSize: 22, 
                  color: Colors.white
                ),
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
                    : "***********",
                  style: const TextStyle(
                    fontSize: 22, 
                    color: Colors.white
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ); 
  }
}