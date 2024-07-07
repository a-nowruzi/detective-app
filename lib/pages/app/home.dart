import 'package:detective/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'games.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ListView(padding: const EdgeInsets.only(left: 15, right: 10, top: 25), children: [
      const SizedBox(height: 20),
      appBar(),
      topBanner(),
      gridButtons(),
      const SizedBox(height: 120),
    ]);
  }

  Widget gridButtons() {
    return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: StaggeredGrid.count(crossAxisCount: 4, mainAxisSpacing: 17, crossAxisSpacing: 17, children: [
          StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 2, child: newCaseTile()),
          StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 1, child: rankingTile()),
          StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 2, child: chatTile()),
          StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 2, child: friendTile()),
          StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 1, child: shopTile())
        ]));
  }

  Widget shopTile() {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Palette.button, borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: const Text('فروشگاه', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 26)));
  }

  Widget friendTile() {
    return Container(
        decoration: BoxDecoration(color: Palette.info, borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(right: 15),
              child: const Text('حریف رفیق',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 26))),
          Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 10),
              height: size.width / 2 - 100,
              child: Image.asset('assets/images/common/fight-1.png'))
        ]));
  }

  Widget chatTile() {
    return Container(
        decoration: BoxDecoration(color: Palette.info, borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(right: 15),
              child: const Text('اتاق گپ',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 26))),
          Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 10),
              height: size.width / 2 - 100,
              child: Image.asset('assets/images/common/chat-1.png'))
        ]));
  }

  Widget rankingTile() {
    return Container(
        decoration: BoxDecoration(color: Palette.banner, borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(right: 15),
                  child: const Text('امتیازها',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 26))),
              Container(
                  alignment: Alignment.centerLeft,
                  height: size.width / 4 - 60,
                  child: Image.asset('assets/images/common/medal-1.png'))
            ]));
  }

  Widget newCaseTile() {
    return Container(
        decoration: BoxDecoration(color: Palette.button, borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(right: 15),
              child: const Text('مشاهده پرونده جدید',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 26))),
          Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 10),
              height: size.width / 2 - 100,
              child: Image.asset('assets/images/common/case-1.png'))
        ]));
  }

  Widget topBanner() {
    return Container(
        margin: const EdgeInsets.only(top: 15, bottom: 10, right: 5),
        width: MediaQuery.of(context).size.width,
        child: Stack(alignment: Alignment.centerRight, children: [
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                  height: (size.width - 50) / 1.5,
                  width: size.width - 40,
                  decoration: BoxDecoration(
                    color: Palette.banner,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    // boxShadow: [BoxShadow(color: Colors.black87.withOpacity(0.1), spreadRadius: 5, blurRadius: 7, offset: const Offset(0, 3))]
                  ))),
          Image.asset('assets/images/common/chess-1.png', height: size.width / 1.5),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    const Text('یکم ذهن گرمی میخوای!؟',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 26)),
                    const Text('چالش شطرنج خرداد ماه ',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 28)),
                    SizedBox(height: (size.width - 320) / 1.5),
                    GestureDetector(
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Palette.button,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black87.withOpacity(0.1),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3))
                                ]),
                            height: 37,
                            width: 90,
                            alignment: Alignment.center,
                            child: const Text('ورود به چالش',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 22))),
                        onTap: () {
                          Get.to(() => const Games());
                        })
                  ])))
        ]));
  }

  Widget appBar() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      IconButton(icon: Icon(Ionicons.menu, size: 28, color: Palette.ink), onPressed: () {}),
      FluttermojiCircleAvatar(backgroundColor: Palette.third, radius: 25)
    ]);
  }
}
