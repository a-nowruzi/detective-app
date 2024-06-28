import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:ionicons/ionicons.dart';
import '../../shared/colors.dart';
import '../../shared/shape.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Column(children: [
      SizedBox(height: size.width - 150, child: Stack(children: [appBar(), avatar()])),
      SingleChildScrollView(
          primary: true,
          child: Column(children: [
            item('اطلاعات حساب', Ionicons.person_outline),
            itemDivider(),
            item('ثبت کد هدیه', Ionicons.gift_outline),
            itemDivider(),
            item('اشتراک گذاری', Ionicons.share_outline),
            itemDivider(),
            item('تماس با پشتیبانی', Ionicons.call_outline),
          ]))
    ]);
  }

  Widget item(String title, IconData icon) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Padding(
            padding: const EdgeInsets.only(right: 15, left: 13),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(children: <Widget>[
                  Icon(icon, color: Palette.ink, size: 26),
                  Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(title, style: TextStyle(fontSize: 22, color: Palette.title)))
                ]),
                Icon(Icons.arrow_forward_ios, color: Palette.ink, size: 14)
              ])
        ),
        onTap: () {});
  }

  Widget itemDivider() {
    return Container(
        width: MediaQuery.of(context).size.width - 120,
        margin: const EdgeInsets.only(top: 16, bottom: 15),
        height: 0.45,
        color: Palette.third);
  }

  Widget avatar() {
    return Positioned(
        width: size.width,
        top: size.width - 295,
        child: FluttermojiCircleAvatar(backgroundColor: Palette.main, radius: 55));
  }

  Widget appBar() {
    return ClipPath(
        clipper: HalfCircularShape(),
        child: Container(width: MediaQuery.of(context).size.width, height: 200, color: Palette.second));
  }
}
