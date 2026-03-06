
import 'package:flutter/material.dart';
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
  LoginPage(),
];

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: pages[currentIndex],
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index){ 
        setState(() {
          currentIndex = index; 
        });
      },
      items: const[ 
        BottomNavigationBarItem(icon: Icon(Icons.home), label :'Home'), 
        BottomNavigationBarItem(icon: Icon(Icons.lock), label : 'Login')
      ]
      ),
  );
}

}