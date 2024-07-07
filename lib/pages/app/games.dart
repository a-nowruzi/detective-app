import 'package:detective/pages/games/chess/chess.dart';
import 'package:detective/pages/games/twentyFortyEight/twenty_forty_eight.dart';
import 'package:detective/pages/games/xo/xo.dart';
import 'package:detective/shared/app_bar.dart';
import 'package:detective/shared/colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';

class Games extends StatefulWidget {
  const Games({super.key});

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  late ScrollController _scrollController;
  double toolbarOpacity = 1.0;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.offset <= 80) {
          toolbarOpacity = (80 - _scrollController.offset) / 80;
        } else {
          toolbarOpacity = 0;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header.appBar('بازی ها'),
        backgroundColor: Palette.bg,
        body: Column(
            children: [item('شطرنج ️', 'chess', const ChessGame()), item('تیک تاک تو', 'xo', const XO()), item('2048', 'xo', const TwentyFortyEight())]));
  }

  Widget item(String title, String image, Widget nav) {
    return GestureDetector(
        child: Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/game/$image.png'), fit: BoxFit.cover),
                border: Border.all(color: Palette.button, width: 0.5),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(left: 7, top: 10),
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                        AttributeWidget(progress: 20, icon: Icons.speed),
                        AttributeWidget(progress: 60, icon: Icons.heart_broken),
                        AttributeWidget(progress: 10, icon: Icons.upcoming)
                      ])),
                  Container(
                      color: Colors.white.withOpacity(0.45),
                      height: 30,
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(title,
                          style: const TextStyle(color: Colors.black54, fontSize: 22, fontWeight: FontWeight.w900)))
                ])),
        onTap: () {
          Get.to(() => nav);
        });
  }
}

class AttributeWidget extends StatelessWidget {
  final double size;
  final double progress;
  final IconData icon;

  const AttributeWidget({
    super.key,
    required this.progress,
    this.size = 35,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: CustomPaint(
            painter: AttributePainter(progressPercent: progress),
            size: Size(size, size),
            child: Container(
                padding: EdgeInsets.all(size / 3.8),
                width: size,
                height: size,
                child: Icon(icon, color: Palette.title, size: 18))));
  }
}

class AttributePainter extends CustomPainter {
  final double progressPercent;
  final double strokeWidth, filledStrokeWidth;

  final Paint bgPaint;
  final Paint strokeBgPaint;
  final Paint strokeFilledPaint;

  AttributePainter({
    required this.progressPercent,
    this.strokeWidth = 2.5,
    this.filledStrokeWidth = 3.0,
  })  : bgPaint = Paint()..color = Colors.grey.withOpacity(0.25),
        strokeBgPaint = Paint()..color = Colors.white.withOpacity(0.25),
        strokeFilledPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = filledStrokeWidth
          ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    canvas.drawCircle(center, radius, bgPaint);
    canvas.drawCircle(center, radius - strokeWidth, strokeBgPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - (strokeWidth / 2)),
      -math.pi / 2, // - 45 degrees to start from top
      (progressPercent / 100) * math.pi * 2,
      false,
      strokeFilledPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
