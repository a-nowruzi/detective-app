import 'dart:math';
import 'package:detective/shared/app_bar.dart';
import 'package:detective/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:ionicons/ionicons.dart';

class ChooseAvatar extends StatelessWidget {
  const ChooseAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: Header.appBar('تغییر قیافه'),
        body: Center(
            child: SingleChildScrollView(
                primary: true,
                child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: FluttermojiCircleAvatar(radius: 100, backgroundColor: Palette.second)),
                  Container(
                      width: min(600, width * 0.95),
                      alignment: Alignment.centerLeft,
                      child: FluttermojiSaveWidget(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Palette.main, borderRadius: const BorderRadius.all(Radius.circular(15))),
                            width: 90,
                            height: 41,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Ionicons.save_outline, color: Colors.white),
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      margin: const EdgeInsets.only(left: 8),
                                      child: const Text('ذخیره',
                                          style: TextStyle(
                                              color: Colors.white, fontWeight: FontWeight.w900, fontSize: 27)))
                                ])),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: FluttermojiCustomizer(
                          scaffoldWidth: min(600, width * 0.95),
                          autosave: false,
                          attributeTitles: const [
                            'مدل مو',
                            'رنگ مو',
                            'ریش و سیبیل',
                            'رنگ موی صورت',
                            'لباس',
                            'رنگ لباس',
                            'چشم هایش',
                            'ابرو',
                            'لب و دهن',
                            'رنگ پوست',
                            'عینک'
                          ],
                          theme: FluttermojiThemeData(
                              iconColor: Palette.ink,
                              primaryBgColor: Palette.second,
                              secondaryBgColor: Palette.third,
                              labelTextStyle: TextStyle(color: Palette.title, fontFamily: 'aisa', fontWeight: FontWeight.bold),
                              selectedIconColor: Palette.main,
                              selectedTileDecoration: BoxDecoration(
                                  border: Border.all(color: Palette.main, width: 2.5),
                                  borderRadius: const BorderRadius.all(Radius.circular(15))),
                              boxDecoration: const BoxDecoration(boxShadow: [BoxShadow()]))))
                ]))));
  }
}
