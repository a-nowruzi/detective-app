import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../shared/colors.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      appBar(),
      Expanded(child: ListView(padding: const EdgeInsets.only(left: 15, right: 10, top: 25), children: const []))
    ]);
  }

//   Widget item(String name, String message, String time){
// return
//   }

  Widget appBar() {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 45),
        child: Row(children: [
          IconButton(icon: Icon(Ionicons.menu, size: 28, color: Palette.ink), onPressed: () {}),
          Container(
              height: 45,
              padding: const EdgeInsets.all(4),
              alignment: Alignment.center,
              child: const Text('پیام های من',
                  style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w900)))
        ]));
  }
}
