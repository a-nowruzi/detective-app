import 'package:detective/pages/games/chess/logic.dart';
import 'package:detective/shared/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';
import 'package:detective/pages/app/bnav.dart';
// import 'package:detective/pages/intro/info.dart';

void main() {
  if (kReleaseMode) {
    Logger.root.level = Level.WARNING;
  }
  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time} - ${record.loggerName} - ${record.message}');
  });

  GetIt.instance.registerSingleton<GameLogic>(GameLogicImplementation(), signalsReady: true);

  WidgetsFlutterBinding.ensureInitialized();

  Logger('main.dart').info('Going full screen');
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  runApp(Phoenix(
      child: GetMaterialApp(
          title: 'کاراگا',
          color: Palette.main,
          debugShowCheckedModeBanner: false,
          home: const AppBottomNav(),
          theme: ThemeData.from(
              colorScheme: ColorScheme.fromSeed(seedColor: Palette.second, surface: Palette.bg),
              textTheme: TextTheme(bodyMedium: TextStyle(color: Palette.ink, fontFamily: 'aisa')),
              useMaterial3: true),
          builder: (BuildContext context, Widget? child) {
            return Directionality(
                textDirection: TextDirection.rtl,
                child: Builder(builder: (BuildContext context) {
                  return MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
                      child: child ?? const AppBottomNav());
                }));
          })));
}
