import 'package:blogger_app/core/themes/colors.dart';
import 'package:flutter/material.dart';

abstract class ThemeText {
  static const TextStyle heading1 = TextStyle(
      fontSize: 40,
      height: 0.5,
      fontWeight: FontWeight.w600,
      color: AppColors.blackBasic);

  //blogs for you title

  static const TextStyle blogsForYou = TextStyle(
      fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.blackBasic);
  static const TextStyle blogs_author = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.blackBasic);

  static const TextStyle heading2 = TextStyle(
      fontSize: 30, fontWeight: FontWeight.w600, color: AppColors.blackBasic);

  static const TextStyle heading3 = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.blackBasic);

  static const TextStyle heading4 = TextStyle(
      fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.white);
  static const TextStyle boldSmText = TextStyle(
      fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.blackBasic);

  static const TextStyle smallBlackTxt =
      TextStyle(fontSize: 15, color: AppColors.blackBasic);

  static const TextStyle snackBarSuccess = TextStyle(
      fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.white);

  //homepage
  // ignore: constant_identifier_names
  static const TextStyle Heading2 =
      TextStyle(fontSize: 35, color: AppColors.blackBasic);

  // ignore: constant_identifier_names
  static const TextStyle Heading3 =
      TextStyle(fontSize: 25, color: AppColors.white);

  static const TextStyle blogText =
      TextStyle(fontSize: 15, color: AppColors.white);

  static const TextStyle blogTextBlack =
      TextStyle(fontSize: 15, color: AppColors.blackBasic);

  static const TextStyle cardCategoryBlog = TextStyle(
      fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.white);

  static const TextStyle normalAppHeading =
      TextStyle(fontSize: 25, color: AppColors.blackBasic);

  static const TextStyle allBlogsTitle =
      TextStyle(fontSize: 17, color: AppColors.blackBasic);

  //drawer
  static const TextStyle drawerTitle =
      TextStyle(fontSize: 15, color: AppColors.blackBasic);

  //blogSingle

  static const TextStyle singleBlogHeading =
      TextStyle(fontSize: 28, color: AppColors.blackBasic);

  static const TextStyle blogDescStyle =
      TextStyle(fontSize: 18, letterSpacing: 1, color: AppColors.blackBasic);
}
