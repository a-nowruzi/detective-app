import 'package:detective/pages/app/chats.dart';
import 'package:detective/pages/app/home.dart';
import 'package:detective/pages/app/profile.dart';
import 'package:detective/pages/app/shop.dart';
import 'package:detective/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:ionicons/ionicons.dart';

class AppBottomNav extends StatefulWidget {
  const AppBottomNav({Key? key}) : super(key: key);

  @override
  State<AppBottomNav> createState() => _AppBottomNavState();
}

class _AppBottomNavState extends State<AppBottomNav> {
  int selectedItem = 0;
  List pages = [const Home(), const Chats(), const Shop(), const Profile()];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Material(color: Palette.bg, child: pages[selectedItem]),
      Align(
          alignment: Alignment.bottomCenter,
          child: SnakeNavigationBar.color(
              behaviour: SnakeBarBehaviour.floating,
              snakeShape: SnakeShape.circle,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
              padding: const EdgeInsets.all(12),
              backgroundColor: Palette.second,
              snakeViewColor: Palette.bg,
              selectedItemColor: Palette.ink,
              unselectedItemColor: Palette.ink,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              currentIndex: selectedItem,
              onTap: (index) => setState(() => selectedItem = index),
              items: const [
                BottomNavigationBarItem(icon: Icon(Ionicons.home_outline)),
                BottomNavigationBarItem(icon: Icon(Ionicons.chatbox_outline)),
                BottomNavigationBarItem(icon: Icon(Ionicons.cart_outline)),
                BottomNavigationBarItem(icon: Icon(Ionicons.person_outline))
              ]))
    ]);
  }
}
