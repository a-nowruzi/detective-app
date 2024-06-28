import 'package:detective/pages/intro/signup.dart';
import 'package:detective/pages/settings/avatar.dart';
import 'package:detective/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class IntroGameAvatar extends StatefulWidget {
  const IntroGameAvatar({Key? key}) : super(key: key);

  @override
  State<IntroGameAvatar> createState() => _IntroGameAvatarState();
}

class _IntroGameAvatarState extends State<IntroGameAvatar> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Material(
        color: Palette.bg,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(children: [
              stepTitle(),
              stepCounter(),
              title(),
              chooseAvatar(),
              description(),
              const Spacer(),
              actions()
            ])));
  }

  Widget stepCounter() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [stepCounterItem(true), stepCounterItem(true), stepCounterItem(false)]);
  }

  Widget stepCounterItem(bool isActive) {
    return Container(
        width: (size.width - 60) / 3,
        height: 5,
        decoration: BoxDecoration(
            color: isActive ? Palette.button : Palette.third,
            borderRadius: const BorderRadius.all(Radius.circular(15))));
  }

  Widget stepTitle() {
    return Container(
        alignment: Alignment.bottomRight,
        margin: const EdgeInsets.only(top: 7),
        child: RichText(
            text: const TextSpan(children: [
          TextSpan(
              text: 'مرحله   ',
              style: TextStyle(color: Colors.grey, fontFamily: 'aisa', fontSize: 30, fontWeight: FontWeight.bold)),
          TextSpan(
              text: '2 از 3',
              style: TextStyle(color: Colors.white, fontFamily: 'aisa', fontSize: 28, fontWeight: FontWeight.bold)),
        ])));
  }

  Widget nextStep() {
    return GestureDetector(
        onTap: () {
          Get.to(const IntroGameSignup());
        },
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
                      child: const Text('ثبت نام',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 26)))
                ])));
  }

  Widget prevStep() {
    return Container();
  }

  Widget actions() {
    return Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [nextStep(), prevStep()]));
  }

  Widget description() {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        alignment: Alignment.centerRight,
        child: const Text('اگه قیافت شبیه خودت نیست، میتونی روی اون کلیک کنی و تغییر قیافه بدی',
            style: TextStyle(color: Colors.grey, fontSize: 28)));
  }

  Widget title() {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        alignment: Alignment.centerRight,
        child: const Text('چهره نگاری',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 35)));
  }

  Widget chooseAvatar() {
    return GestureDetector(
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            width: MediaQuery.of(context).size.width,
            height: (size.width - 55) / 2,
            child: FluttermojiCircleAvatar(backgroundColor: Palette.second, radius: 100)),
        onTap: () {
          Get.to(() => const ChooseAvatar());
        });
  }
}
