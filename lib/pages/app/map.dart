// import 'package:flutter/material.dart';
// import 'package:game_levels_scrolling_map/game_levels_scrolling_map.dart';
// import 'package:game_levels_scrolling_map/model/point_model.dart';
//
// class Map extends StatefulWidget {
//   const Map({Key? key}) : super(key: key);
//
//   @override
//   State<Map> createState() => _MapState();
// }
//
// class _MapState extends State<Map> {
//   List<PointModel> points = [];
//
//   @override
//   void initState() {
//     super.initState();
//     for (int i = 0; i < 20; i++) {
//       points.add(PointModel(100, testWidget(i)));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GameLevelsScrollingMap.scrollable(
//         imageUrl: "assets/images/map/map_vertical.png",
//         direction: Axis.vertical,
//         reverseScrolling: true,
//         pointsPositionDeltaX: 25,
//         pointsPositionDeltaY: 25,
//         svgUrl: 'assets/images/map/map_vertical.svg',
//         points: points);
//   }
//
//   Widget testWidget(int order) {
//     return InkWell(
//         child: Stack(alignment: Alignment.center, children: [
//           Image.asset("assets/images/map/map_vertical_point.png", fit: BoxFit.fitWidth, width: 50),
//           Text("$order", style: const TextStyle(color: Colors.black, fontSize: 15))
//         ]),
//         onTap: () {
//           showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(content: Text("Point $order"), actions: <Widget>[
//                   ElevatedButton(
//                       child: const Text("OK"),
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       })
//                 ]);
//               });
//         });
//   }
// }
