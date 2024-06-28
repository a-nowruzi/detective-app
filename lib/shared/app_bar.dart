import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

class Header {
  static Widget appBarNoButton(String title) {
    return Container(
        width: double.infinity,
        height: 100,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
            color: Palette.main,
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))),
        child: Text(title,
            style: TextStyle(fontWeight: FontWeight.w900, fontFamily: 'aisa', fontSize: 29, color: Palette.title)));
  }

  static PreferredSizeWidget appBarWithAction(String title, IconData icon, String tooltip, VoidCallback callback,
      [double elevation = 4]) {
    return AppBar(
        title: Text(title,
            style: TextStyle(fontWeight: FontWeight.w900, fontFamily: 'aisa', fontSize: 29, color: Palette.title)),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: IconThemeData(color: Palette.title),
        backgroundColor: Palette.main,
        elevation: elevation,
        actions: <Widget>[IconButton(icon: Icon(icon, color: Palette.ink), tooltip: tooltip, onPressed: callback)]);
  }

  static PreferredSizeWidget appBar(String title) {
    return AppBar(
        title: Text(title,
            style: TextStyle(fontWeight: FontWeight.w900, fontFamily: 'aisa', fontSize: 29, color: Palette.title)),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: IconThemeData(color: Palette.title),
        backgroundColor: Palette.main);
  }

  static PreferredSizeWidget appBarNoShadow(String title) {
    return AppBar(
        title: Text(title,
            style: TextStyle(fontWeight: FontWeight.w900, fontFamily: 'aisa', fontSize: 29, color: Palette.title)),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: IconThemeData(color: Palette.title),
        backgroundColor: Palette.main,
        elevation: 0);
  }
}
