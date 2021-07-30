import 'package:astro_app/Dashboard/tinderCard/provider/feedback_position_provider.dart';
import 'package:astro_app/constants/constants.dart';
import 'package:astro_app/routes/index.dart';
import 'package:astro_app/utils/Theme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'NotFound/NotFoundPage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return ChangeNotifierProvider(
      create: (context) => FeedbackPositionProvider(),
          child: MaterialApp(
        title: 'Cielo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppTheme.appColour,
          textTheme: AppTheme.textTheme,
          platform: TargetPlatform.iOS
        ),
        initialRoute: SPLASH_SCREEN,
        onGenerateRoute: Routes.routes,
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (context) => NotFoundPage()
          );
        },
      ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}