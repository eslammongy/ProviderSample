import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData light = ThemeData(
    cardColor: HexColor("CDDCEB"),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.deepOrange,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.deepOrange,
            statusBarBrightness: Brightness.light,
            systemNavigationBarColor: Colors.deepOrange)),
    // ignore: deprecated_member_use
    accentColor: Colors.orangeAccent,
    hintColor: HexColor("2B2B2B"));

ThemeData dark = ThemeData(
    cardColor: HexColor("4A4A4A"),
    scaffoldBackgroundColor: HexColor("353535"),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.indigo,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.indigo,
            statusBarBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.indigo)),
    // ignore: deprecated_member_use
    accentColor: Colors.blueAccent,
    hintColor: Colors.white);
