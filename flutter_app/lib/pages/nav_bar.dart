
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/add_new_sites.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';

class NavBar extends StatefulWidget{ 
  const NavBar({super.key});

  @override
  State<NavBar> createState() =>_NavState(); 
}


class _NavState extends State<NavBar> { 
int currentIndex = 0; 

final List<Widget> pages = const[ 
  HomePage(),
  AddNewSites(),
  LoginPage(),
];

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: pages[currentIndex],
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index){ 
        if ( index == 2 ) { 
            Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => LoginPage())
             ,(route) => false,
            );
            return; 
          }
        
        setState(() {
          //log out
         currentIndex = index;
          
        });
      },
      items: const[ 
        BottomNavigationBarItem(icon: Icon(Icons.home), label :'Home'), 
        BottomNavigationBarItem(icon: Icon(Icons.add), label : " Add Password"),
        BottomNavigationBarItem(icon: Icon(Icons.logout), label : 'Log Out')
      ]
      ),
  );
}

}