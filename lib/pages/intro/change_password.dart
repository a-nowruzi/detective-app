import 'package:detective/shared/colors.dart';
import 'package:detective/shared/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import '../app/bnav.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late Size size;
  TextEditingController userNameController = TextEditingController(text: '');
  TextEditingController mobileOrEmailController = TextEditingController(text: '');

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
              textInput(mobileOrEmailController, 'شماره موبایل یا ایمیل', Ionicons.phone_portrait_outline),
              description(
                  'اگر شماره موبایل یا ایمیلت رو توی پروفایلت ثبت کردی، اینجا وارد کن تا کد فعالسازی برات ارسال شه. در غیر این صورت، با پشتیبانی تماس بگیر.'),
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
            width: 160,
            height: 45,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(right: 5),
                      child: const Text('ارسال کد فعالسازی',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 26))),
                  const Icon(Ionicons.arrow_back_outline, color: Colors.white)
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

  Widget description(String text) {
    return Container(
        margin: const EdgeInsets.only(top: 26),
        alignment: Alignment.centerRight,
        child: Text(text, style: const TextStyle(color: Colors.grey, fontSize: 27)));
  }

  Widget title() {
    return Container(
        margin: const EdgeInsets.only(top: 25, bottom: 10),
        alignment: Alignment.centerRight,
        child: const Text('فراموشی کلمه عبور',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 35)));
  }
}
