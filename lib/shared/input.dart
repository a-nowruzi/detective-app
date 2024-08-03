import 'package:detective/shared/colors.dart';
import 'package:flutter/material.dart';
import 'convertor.dart';

class TextInput {
  static Widget input(
      {required String title,
      required IconData icon,
      required TextEditingController controller,
      TextInputType type = TextInputType.text,
      bool secure = false}) {
    return Container(
        height: 55,
        width: double.infinity,
        // decoration: BoxDecoration(boxShadow: [
        //   BoxShadow(color: Palette.second.withOpacity(0.1), spreadRadius: 3, blurRadius: 4, offset: const Offset(0, 2))
        // ]),
        child: TextFormField(
            controller: controller,
            textDirection: (type == TextInputType.emailAddress || type == TextInputType.phone)
                ? TextDirection.ltr
                : TextDirection.rtl,
            keyboardType: type,
            onChanged: (text) {
              controller.text = convertNumberToEnglish(controller.text);
              controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));
            },
            decoration: InputDecoration(
                labelText: title,
                labelStyle: const TextStyle(color: Colors.grey, fontFamily: 'aisa'),
                fillColor: Palette.bg,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Palette.second, width: 2), borderRadius: BorderRadius.circular(15)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Palette.second, width: 2), borderRadius: BorderRadius.circular(15)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Palette.second, width: 2),
                    borderRadius: BorderRadius.circular(15)))));
  }
}
