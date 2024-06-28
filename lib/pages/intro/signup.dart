import 'package:detective/pages/settings/avatar.dart';
import 'package:detective/shared/colors.dart';
import 'package:detective/shared/input.dart';
import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../app/bnav.dart';

class IntroGameSignup extends StatefulWidget {
  const IntroGameSignup({Key? key}) : super(key: key);

  @override
  State<IntroGameSignup> createState() => _IntroGameSignupState();
}

class _IntroGameSignupState extends State<IntroGameSignup> {
  late Size size;
  TextEditingController userNameController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController rePasswordController = TextEditingController(text: '');
  TextEditingController invitationController = TextEditingController(text: '');

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
              textInput(userNameController, 'نام کاریری', Ionicons.person_outline),
              textInput(passwordController, 'کلمه عبور', Ionicons.lock_closed_outline),
              textInput(rePasswordController, 'تکرار کلمه عبور', Ionicons.lock_closed_outline),
              textInput(invitationController, 'کد معرف (اختیاری)', Ionicons.gift_outline),
              description('برای ورود به دنیای کارآگاه ها آماده ای!؟'),
              const Spacer(),
              actions()
            ])));
  }

  Widget textInput(TextEditingController controller, String title, IconData icon) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: TextInput.input(title: title, icon: icon, controller: controller));
  }

  Widget stepCounter() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [stepCounterItem(true), stepCounterItem(true), stepCounterItem(true)]);
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
              text: '3 از 3',
              style: TextStyle(color: Colors.white, fontFamily: 'aisa', fontSize: 28, fontWeight: FontWeight.bold)),
        ])));
  }

  Widget nextStep() {
    return GestureDetector(
        onTap: () {
          Get.to(() => const AppBottomNav());
        },
        child: Container(
            decoration: BoxDecoration(color: Palette.main, borderRadius: const BorderRadius.all(Radius.circular(15))),
            width: 130,
            height: 45,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Ionicons.game_controller_outline, color: Colors.white),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 15),
                      child: const Text('ورود به بازی',
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

  Widget description(String text) {
    return Container(
        margin: const EdgeInsets.only(top: 22),
        alignment: Alignment.centerRight,
        child: Text(text, style: const TextStyle(color: Colors.grey, fontSize: 28)));
  }

  Widget title() {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        alignment: Alignment.centerRight,
        child: const Text('حساب کاربری',
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
