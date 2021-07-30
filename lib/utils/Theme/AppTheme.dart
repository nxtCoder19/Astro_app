
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color black = Color(0xFF000000);
  static const Color nearlyIndigo = Color(0xFF00695C);
  static const Color nearlyYellow = Color(0xFFF9A825);

  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color notWhiteLighter = Color(0xFFEFF3FF);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color appColour = Color(0xFF5B16D0);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);
  static const Color backgroundColor = Color(0xFFFFFFFF);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'WorkSans';
  static const double paddingValue = 8.0;
  static const double cardElevationValue = 2.0;
  static const double cardPaddingValue = 4.0;

  static const registrationPaddingValue = EdgeInsets.symmetric(horizontal: 20);
  static const double registrationGapValue = 5;

  static const TextTheme textTheme = TextTheme(
    display1: display1,
    headline: headline,
    title: title,
    subtitle: subtitle,
    body2: body2,
    body1: body1,
    caption: caption,
  );

  static const TextStyle display1 = TextStyle(
    // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle headline = TextStyle(
    // h5 -> headline
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextStyle title = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle subtitle = TextStyle(
    // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle body2 = TextStyle(
    // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle caption = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );

  static const TextStyle newsTitle = TextStyle(
      decoration: TextDecoration.underline,
      decorationColor: AppTheme.nearlyIndigo,
      fontWeight: FontWeight.w600,
      fontSize: 22
    );


  static TextTheme _buildTextTheme(TextTheme base) {
    const String fontName = 'WorkSans';
    return base.copyWith(
      title: base.title.copyWith(fontFamily: fontName),
      body1: base.title.copyWith(fontFamily: fontName),
      body2: base.title.copyWith(fontFamily: fontName),
      button: base.title.copyWith(fontFamily: fontName),
      caption: base.title.copyWith(fontFamily: fontName),
      display1: base.title.copyWith(fontFamily: fontName),
      display2: base.title.copyWith(fontFamily: fontName),
      display3: base.title.copyWith(fontFamily: fontName),
      display4: base.title.copyWith(fontFamily: fontName),
      headline: base.title.copyWith(fontFamily: fontName),
      overline: base.title.copyWith(fontFamily: fontName),
      subhead: base.title.copyWith(fontFamily: fontName),
      subtitle: base.title.copyWith(fontFamily: fontName),
    );
  }

  // static ThemeData buildLightTheme() {
  //   final Color primaryColor = HexColor('#54D3C2');
  //   final Color secondaryColor = HexColor('#54D3C2');
  //   final ColorScheme colorScheme = const ColorScheme.light().copyWith(
  //     primary: primaryColor,
  //     secondary: secondaryColor,
  //   );
  //   final ThemeData base = ThemeData.light();
  //   return base.copyWith(
  //     colorScheme: colorScheme,
  //     primaryColor: primaryColor,
  //     buttonColor: primaryColor,
  //     indicatorColor: Colors.white,
  //     splashColor: Colors.white24,
  //     splashFactory: InkRipple.splashFactory,
  //     accentColor: secondaryColor,
  //     canvasColor: Colors.white,
  //     backgroundColor: const Color(0xFFFFFFFF),
  //     scaffoldBackgroundColor: const Color(0xFFF6F6F6),
  //     errorColor: const Color(0xFFB00020),
  //     buttonTheme: ButtonThemeData(
  //       colorScheme: colorScheme,
  //       textTheme: ButtonTextTheme.primary,
  //     ),
  //     textTheme: _buildTextTheme(base.textTheme),
  //     primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
  //     accentTextTheme: _buildTextTheme(base.accentTextTheme),
  //     platform: TargetPlatform.iOS,
  //   );
  // }

  static const TextStyle yesButtonTextStyle = TextStyle(fontSize: 14);
  static const TextStyle noButtonTextStyle = TextStyle(fontSize: 16);
  static const TextStyle alertDialogTitleTextStyle = TextStyle(fontSize: 16);
}