// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
//
// final router = GoRouter(
//   routes: [
//     GoRoute(
//         path: '/',
//         builder: (context, state) =>
//         const MainMenuScreen(key: Key('main menu')),
//         routes: [
//           GoRoute(
//               path: 'play',
//               pageBuilder: (context, state) => buildMyTransition<void>(
//                 child: const LevelSelectionScreen(
//                     key: Key('level selection')),
//                 color: context.watch<Palette>().backgroundLevelSelection,
//               ),
//               routes: [
//                 GoRoute(
//                   path: 'session/:level',
//                   pageBuilder: (context, state) {
//                     final levelNumber = int.parse(state.params['level']!);
//                     final level = gameLevels
//                         .singleWhere((e) => e.number == levelNumber);
//                     return buildMyTransition<void>(
//                       child: PlaySessionScreen(
//                         level,
//                         key: const Key('play session'),
//                       ),
//                       color: context.watch<Palette>().backgroundPlaySession,
//                     );
//                   },
//                 ),
//                 GoRoute(
//                   path: 'won',
//                   pageBuilder: (context, state) {
//                     final map = state.extra! as Map<String, dynamic>;
//                     final score = map['score'] as Score;
//
//                     return buildMyTransition<void>(
//                       child: WinGameScreen(
//                         score: score,
//                         key: const Key('win game'),
//                       ),
//                       color: context.watch<Palette>().backgroundPlaySession,
//                     );
//                   },
//                 )
//               ]),
//           GoRoute(
//             path: 'settings',
//             builder: (context, state) =>
//             const SettingsScreen(key: Key('settings')),
//           ),
//         ]),
//   ],
// );
