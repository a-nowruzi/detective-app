import 'package:detective/pages/intro/avatar.dart';
import 'package:detective/shared/colors.dart';
import 'package:detective/shared/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class IntroGameGender extends StatefulWidget {
  const IntroGameGender({super.key});

  @override
  State<IntroGameGender> createState() => _IntroGameGenderState();
}

class _IntroGameGenderState extends State<IntroGameGender> {
  late Size size;
  TextEditingController nickNameController = TextEditingController(text: '');
  bool isMale = true;

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
              gender(),
              description(),
              nickName(),
              const Spacer(),
              actions()
            ])));
  }

  Widget nickName() {
    return Container(
        margin: const EdgeInsets.only(top: 15),
        child: TextInput.input(title: 'اسم', icon: Ionicons.person_circle_outline, controller: nickNameController));
  }

  Widget stepCounter() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [stepCounterItem(true), stepCounterItem(false), stepCounterItem(false)]);
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
              text: '1 از 3',
              style: TextStyle(color: Colors.white, fontFamily: 'aisa', fontSize: 28, fontWeight: FontWeight.bold)),
        ])));
  }

  Widget nextStep() {
    return GestureDetector(
        onTap: () {
          Get.to(const IntroGameAvatar());
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
                      child: const Text('انتخاب قیافه',
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
        child: const Text('جنسیت و اسمت رو برای اینکه بدونیم چی صدات بزنیم، لازم داریم',
            style: TextStyle(color: Colors.grey, fontSize: 28)));
  }

  Widget title() {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        alignment: Alignment.centerRight,
        child: const Text('ساخت پروفایل',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 35)));
  }

  Widget gender() {
    return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [image('boy-1', 'پسر', isMale), image('girl-1', 'دختر', !isMale)]));
  }

  Widget image(String asset, String title, bool isSelected) {
    return GestureDetector(
        child: Column(children: [
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              width: (size.width - 55) / 2,
              height: (size.width - 55) / 2,
              decoration: BoxDecoration(
                  color: isSelected ? Palette.info : Colors.transparent,
                  border: Border.all(color: Palette.third, width: 2.5),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox.fromSize(
                      size: Size.fromRadius((size.width - 70) / 2),
                      child: Image.asset('assets/images/intro/$asset.png', fit: BoxFit.contain)))),
          Text(title,
              style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey,
                  fontWeight: FontWeight.w900,
                  fontSize: isSelected ? 27 : 24))
        ]),
        onTap: () {
          setState(() {
            isMale = (asset == 'boy-1' && !isSelected)
                ? true
                : (asset == 'girl-1' && !isSelected)
                    ? false
                    : isMale;
          });
        });
  }
}
