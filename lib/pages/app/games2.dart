import 'package:detective/shared/app_bar.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../shared/colors.dart';

class Games extends StatefulWidget {
  const Games({super.key});

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  double rowHeight = 282;
  List<HeroModel> heroes = [
    HeroModel(
      name: 'شطرنج',
      image: 'chess',
      speed: 16.0,
      health: 40.0,
      attack: 65.0,
    ),
    HeroModel(
      name: 'تیک تاک تو',
      image: 'xo',
      speed: 25.0,
      health: 50.0,
      attack: 75.0,
    ),
    HeroModel(
      name: 'سودوکو',
      image: 'chess',
      speed: 10.0,
      health: 80.0,
      attack: 80.0,
    ),
  ];

  double radians(double degrees) => degrees * (math.pi / 180.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header.appBar('بازی ها'),
        body: ListView.builder(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            itemCount: heroes.length,
            itemBuilder: (context, index) {
              return item(heroes[index]);
            }));
  }

  Widget item(HeroModel hero) {
    return SizedBox(
        height: rowHeight,
        child: Stack(alignment: Alignment.center, children: [
          Transform.translate(
              offset: const Offset(-10, 0),
              child: Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.01)
                    ..rotateY(radians(1.5)),
                  child: Container(
                      height: 216,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: const BorderRadius.all(Radius.circular(22)))))),
          Transform.translate(
              offset: const Offset(-44, 0),
              child: Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.01)
                    ..rotateY(radians(8)),
                  child: Container(
                      height: 188,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: const BorderRadius.all(Radius.circular(22)))))),
          Align(
              alignment: Alignment.centerLeft,
              child: Hero(tag: hero.name, child: Image.asset('assets/images/game/${hero.image}.png', width: 200))),
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                  margin: const EdgeInsets.only(right: 58),
                  padding: const EdgeInsets.symmetric(vertical: 34),
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    AttributeWidget(progress: hero.speed, child: Icon(Icons.speed, color: Palette.title, size: 18)),
                    AttributeWidget(
                        progress: hero.health,
                        child: Icon(Icons.health_and_safety_outlined, color: Palette.title, size: 18)),
                    AttributeWidget(progress: hero.attack, child: Icon(Icons.ac_unit, color: Palette.title, size: 18)),
                    SizedBox(
                        height: 32,
                        child: TextButton(
                            child: Text(hero.name, style: const TextStyle(color: Colors.white, fontSize: 12)),
                            onPressed: () {
                              // Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
                              //   return HeroDetailsPage(hero);
                              // }));
                            }))
                  ])))
        ]));
  }
}

class HeroModel {
  final String name;
  final String image;
  final double speed, health, attack;

  HeroModel({
    required this.name,
    required this.image,
    required this.speed,
    required this.health,
    required this.attack,
  });
}

class AttributeWidget extends StatelessWidget {
  final double size;
  final double progress;
  final Widget child;

  const AttributeWidget({
    super.key,
    required this.progress,
    this.size = 42,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: AttributePainter(
        progressPercent: progress,
      ),
      size: Size(size, size),
      child: Container(
        padding: EdgeInsets.all(size / 3.8),
        width: size,
        height: size,
        child: child,
      ),
    );
  }
}

class AttributePainter extends CustomPainter {
  final double progressPercent;
  final double strokeWidth, filledStrokeWidth;

  final bgPaint, strokeBgPaint, strokeFilledPaint;

  AttributePainter({
    required this.progressPercent,
    this.strokeWidth = 2.0,
    this.filledStrokeWidth = 4.0,
  })  : bgPaint = Paint()..color = Colors.white.withOpacity(0.25),
        strokeBgPaint = Paint()..color = const Color(0xffD264C9),
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
