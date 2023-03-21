import 'package:flutter/material.dart';
import '../../themes/themes.dart';

abstract class ThemeText {
  static const TextStyle heading1 = TextStyle(
      fontSize: 40,
      height: 0.5,
      fontWeight: FontWeight.w600,
      color: ThemeColor.blackBasic);

  static const TextStyle heading2 = TextStyle(  
      fontSize: 30,
      height: 0.5,
      fontWeight: FontWeight.w600,
      color: ThemeColor.blackBasic);

  static const TextStyle heading3 = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: ThemeColor.blackBasic);

  static const TextStyle heading4 = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: ThemeColor.white);
  static const TextStyle boldSmText = TextStyle(
      fontSize: 10,
      height: 0.5,
      fontWeight: FontWeight.bold,
      color: ThemeColor.blackBasic);

  static const TextStyle smallBlackTxt =
      TextStyle(fontSize: 15, color: ThemeColor.blackBasic);

  static const TextStyle snackBarSuccess = TextStyle(
      fontSize: 10, fontWeight: FontWeight.bold, color: ThemeColor.white);
  static const TextStyle snackBarErr = TextStyle(
      fontSize: 10, fontWeight: FontWeight.bold, color: ThemeColor.white);
}
