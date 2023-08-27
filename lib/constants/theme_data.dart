import 'dart:ui';

import 'package:flutter/material.dart';
import 'constants.dart';

ThemeData themeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: kPrimaryColor,
  primarySwatch: Colors.deepOrange,
  // accentColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  toggleableActiveColor: Colors.black,
  // inputDecorationTheme: InputDecorationTheme(
  //   border: const OutlineInputBorder(
  //     borderSide: BorderSide(color: Colors.black),
  //   ),
  //   enabledBorder: OutlineInputBorder(
  //     borderSide: BorderSide(color: Colors.black.withOpacity(0.1)),
  //   ),
  //   focusedBorder: const OutlineInputBorder(
  //     borderSide: BorderSide(color: Colors.black),
  //   ),
  //   labelStyle: const TextStyle(
  //     color: Colors.black,
  //   ),
  // ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.black,
    selectionColor: Colors.black12,
    selectionHandleColor: Colors.black,
  ),
);
