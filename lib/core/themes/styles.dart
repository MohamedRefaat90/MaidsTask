import 'package:flutter/material.dart';
import 'package:maids_task/core/extension/num_extension.dart';
import 'package:maids_task/core/themes/app_pallete.dart';

class AppStyles {
  static TextStyle font24BoldWhite(BuildContext context) {
    return TextStyle(
      color: AppPalette.white,
      fontSize: 24.scaleText,
      fontWeight: FontWeight.w700,
      fontFamily: 'Schibsted Grotesk',
    );
  }

  static TextStyle font15SemiBoldPurple(BuildContext context) {
    return TextStyle(
      color: AppPalette.purple,
      fontSize: 15.scaleText,
      fontWeight: FontWeight.w600,
      fontFamily: 'Schibsted Grotesk',
    );
  }

  static TextStyle font18SemiBoldWhite(BuildContext context) {
    return TextStyle(
      color: AppPalette.white,
      fontSize: 18.scaleText,
      fontWeight: FontWeight.w600,
      fontFamily: 'Schibsted Grotesk',
    );
  }

  static TextStyle font15MediumWhite(BuildContext context) {
    return TextStyle(
      color: AppPalette.white,
      fontSize: 15.scaleText,
      fontWeight: FontWeight.w500,
      fontFamily: 'Schibsted Grotesk',
    );
  }

  static TextStyle font15MediumGrey(BuildContext context) {
    return TextStyle(
      color: Colors.grey,
      fontSize: 15.scaleText,
      fontWeight: FontWeight.w500,
      fontFamily: 'Schibsted Grotesk',
    );
  }

  static TextStyle font18SemiBoldPurple(BuildContext context) {
    return TextStyle(
      color: AppPalette.purple,
      fontSize: 18.scaleText,
      fontWeight: FontWeight.w600,
      fontFamily: 'Schibsted Grotesk',
    );
  }

  static TextStyle font15MediumPurple(BuildContext context) {
    return TextStyle(
      color: AppPalette.purple,
      fontSize: 15.scaleText,
      fontWeight: FontWeight.w500,
      fontFamily: 'Schibsted Grotesk',
    );
  }

  static TextStyle font24BoldPurple(BuildContext context) {
    return TextStyle(
      color: AppPalette.purple,
      fontSize: 24.scaleText,
      fontWeight: FontWeight.w700,
      fontFamily: 'Schibsted Grotesk',
    );
  }
}
