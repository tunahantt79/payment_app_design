import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:payment_app/view/bottomnavigatonbar/home_page.dart';
import 'package:payment_app/view/bottomnavigatonbar/profile_page.dart';
import 'package:payment_app/view/bottomnavigatonbar/sagl%C4%B1k_page.dart';

class BottomNavigatorBar extends StatefulWidget {
  const BottomNavigatorBar({super.key});

  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  int currentPageIndex = 0;

  List<Widget> pages = [
    const HomePage(),
    const SaglikPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                IconlyBold.wallet,
                size: 15,
                color: Colors.deepPurple,
              ),
              label: 'My Wallet'),
          BottomNavigationBarItem(
            icon: Icon(
              IconlyBold.heart,
              size: 15,
              color: Colors.red,
            ),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.border_all, size: 15), label: 'Profil'),
        ],
        currentIndex: currentPageIndex,
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }
}
