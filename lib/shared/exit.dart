import 'dart:io';
import 'package:flutter/material.dart';

Future<bool> showExitPopup(context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            content: SizedBox(
                height: 95,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("آیا میخواهید خارج شوید؟"),
                      const SizedBox(height: 20),
                      Row(children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  exit(0);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red.shade800),
                                child: const Text("خروج"))),
                        const SizedBox(width: 15),
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white),
                                child: const Text("خیر",
                                    style: TextStyle(color: Colors.black))))
                      ])
                    ])));
      });
}
