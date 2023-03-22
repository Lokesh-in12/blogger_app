import 'package:flutter/material.dart';
import '../../themes/themes.dart';

abstract class ThemeText {
  static const TextStyle heading1 = TextStyle(
      fontSize: 40,
      height: 0.5,
      fontWeight: FontWeight.w600,
      color: ThemeColor.blackBasic);

  static const TextStyle heading2 = TextStyle(
      fontSize: 30, fontWeight: FontWeight.w600, color: ThemeColor.blackBasic);

  static const TextStyle heading3 = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, color: ThemeColor.blackBasic);

  static const TextStyle heading4 = TextStyle(
      fontSize: 15, fontWeight: FontWeight.w600, color: ThemeColor.white);
  static const TextStyle boldSmText = TextStyle(
      fontSize: 10, fontWeight: FontWeight.bold, color: ThemeColor.blackBasic);

  static const TextStyle smallBlackTxt =
      TextStyle(fontSize: 15, color: ThemeColor.blackBasic);

  static const TextStyle snackBarSuccess = TextStyle(
      fontSize: 10, fontWeight: FontWeight.bold, color: ThemeColor.white);
  static const TextStyle snackBarErr = TextStyle(
      fontSize: 10, fontWeight: FontWeight.bold, color: ThemeColor.white);

  //homepage
  // ignore: constant_identifier_names
  static const TextStyle Heading2 =
      TextStyle(fontSize: 35, color: ThemeColor.blackBasic);

  // ignore: constant_identifier_names
  static const TextStyle Heading3 =
      TextStyle(fontSize: 25, color: ThemeColor.white);

  static const TextStyle blogText =
      TextStyle(fontSize: 15, color: ThemeColor.white);

  static const TextStyle blogTextBlack =
      TextStyle(fontSize: 15, color: ThemeColor.blackBasic);

  static const TextStyle cardCategoryBlog = TextStyle(
      fontSize: 12, fontWeight: FontWeight.bold, color: ThemeColor.white);

  static const TextStyle normalAppHeading =
      TextStyle(fontSize: 25, color: ThemeColor.blackBasic);

  static const TextStyle allBlogsTitle =
      TextStyle(fontSize: 17, color: ThemeColor.blackBasic);

  //drawer
  static const TextStyle drawerTitle =
      TextStyle(fontSize: 15, color: ThemeColor.blackBasic);

  //blogSingle

  static const TextStyle singleBlogHeading =
      TextStyle(fontSize: 35, color: ThemeColor.white);

  static const TextStyle blogDescStyle =
      TextStyle(fontSize: 20, letterSpacing: 1, color: ThemeColor.blackBasic);
}
