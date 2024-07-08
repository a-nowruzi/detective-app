import 'package:flutter/material.dart';
import 'constants.dart';

Widget tile(String number, double width, height, int color, double size){
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color: Color(color), borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        child: Center(
            child: Text(number,
                style: TextStyle(fontSize: size, fontWeight: FontWeight.bold, color: Color(MyColor.fontColorTwoFour)))));
}
