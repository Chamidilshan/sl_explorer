import 'package:flutter/material.dart';
import 'home_page.dart';
import 'orders.dart';
import 'gallery.dart';
import 'package:SL_Explorer/features/home/Festivals/screens/festivals_list.dart';
import 'package:SL_Explorer/features/home/SL_A_Z/Screens/sl_A_Z.dart';
import 'profile.dart';

class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({super.key});

  @override
  State<bottomNavigationBar> createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  List pages = [
    const HomePage(),
    A_Z_page(),
    FestivalListPage(),
    OrdersPage(),
  ];
  int currentIndex=0;
  void onTap(int index){
    setState(() {
      currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: const Color(0xFFfd8103),
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language_outlined),
            label: 'SL A-Z',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.festival_outlined),
            label: 'Festive',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_outlined),
            label: 'Orders',
          ),
        ],
      ),
    );
  }
}
