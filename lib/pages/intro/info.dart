import 'package:detective/pages/intro/login.dart';
import 'package:detective/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'gender.dart';

class IntroGameInfo extends StatefulWidget {
  const IntroGameInfo({Key? key}) : super(key: key);

  @override
  State<IntroGameInfo> createState() => _IntroGameInfoState();
}

class _IntroGameInfoState extends State<IntroGameInfo> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Material(
        color: Palette.bg,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(children: [image(), title(), description(), const Spacer(), actions()])));
  }

  Widget signUp() {
    return GestureDetector(
        child: Container(
            decoration: BoxDecoration(color: Palette.main, borderRadius: const BorderRadius.all(Radius.circular(15))),
            width: 130,
            height: 45,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Ionicons.arrow_forward, color: Colors.white),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 15),
                      child: const Text('بازیکن جدید',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 26)))
                ])),
        onTap: () => Get.to(const IntroGameGender()));
  }

  Widget login() {
    return GestureDetector(
        child: Container(
            decoration: BoxDecoration(color: Palette.button, borderRadius: const BorderRadius.all(Radius.circular(15))),
            width: 120,
            height: 45,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(right: 15),
                      child: const Text('ادامه بازی',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 26))),
                  const Icon(Ionicons.arrow_back, color: Colors.white)
                ])),
        onTap: () => Get.to(const Login()));
  }

  Widget actions() {
    return Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [signUp(), login()]));
  }

  Widget description() {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        alignment: Alignment.centerRight,
        child: const Text('با بازیکن های دیگه رقابت کن، اگه خوشت اومد رفاقت کن!',
            style: TextStyle(color: Colors.grey, fontSize: 29)));
  }

  Widget title() {
    return Container(
        margin: const EdgeInsets.only(top: 15),
        alignment: Alignment.centerRight,
        child: const Text('مثل یه کارآگاه، پرونده های واقعی رو حل کن',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 32)));
  }

  Widget image() {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 30),
        height: (size.width - 50) / 1.3,
        decoration: BoxDecoration(
            color: Palette.button,
            // border: Border.all(color: Palette.third),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox.fromSize(
                size: Size.fromRadius((size.width - 50) / 1.3),
                child: Image.asset('assets/images/common/board-1.jpg', fit: BoxFit.fill))));
  }
}
