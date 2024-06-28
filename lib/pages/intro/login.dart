import 'package:detective/pages/intro/change_password.dart';
import 'package:detective/shared/colors.dart';
import 'package:detective/shared/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import '../app/bnav.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late Size size;
  TextEditingController userNameController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Material(
        color: Palette.bg,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(children: [
              title(),
              textInput(userNameController, 'نام کاریری', Ionicons.person_outline),
              textInput(passwordController, 'کلمه عبور', Ionicons.lock_closed_outline),
              description(),
              const Spacer(),
              actions()
            ])));
  }

  Widget textInput(TextEditingController controller, String title, IconData icon) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: TextInput.input(title: title, icon: icon, controller: controller));
  }

  Widget login() {
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
                  Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(right: 5),
                      child: const Text('ورود به بازی',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 26))),
                  const Icon(Ionicons.game_controller_outline, color: Colors.white)
                ])));
  }

  Widget prevStep() {
    return Container();
  }

  Widget actions() {
    return Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [prevStep(), login()]));
  }

  Widget description() {
    return GestureDetector(
        child: Container(
            margin: const EdgeInsets.only(top: 26),
            alignment: Alignment.centerRight,
            child: const Text('😒 حافظه ام کوتاه مدته و رمز عبورم رو فراموش کردم',
                style: TextStyle(color: Colors.grey, fontSize: 27))),
        onTap: () {
          Get.to(() => const ChangePassword());
        });
  }

  Widget title() {
    return Container(
        margin: const EdgeInsets.only(top: 25, bottom: 10),
        alignment: Alignment.centerRight,
        child: const Text('ورود به حساب کاربری',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 35)));
  }
}
