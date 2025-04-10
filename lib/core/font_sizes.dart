import 'package:flutter/material.dart';
import 'package:sample_app/core/colors.dart';

class CustomFontSizes {
    final heading5 = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 24,
      letterSpacing: -0.05,
      color: CustomColors().neutralStronger,
      height: 1,
        );
    final heading5Medium = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20,
      letterSpacing: -0.05,
      color: CustomColors().neutralStronger,
      height: 20/24,
        );
    final bodySmall = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: 14/22,
      color: CustomColors().neutralWeak,
      height: 1,
        );
    final bodySmallRegular = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: 0,
      color: CustomColors().neutralStrong,
      height: 1,
        );
    final bodySmallMedium = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      letterSpacing: 0,
      color: CustomColors().neutralStrong,
      height: 1,
        );
 final bodySmallRegularDanger = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: 0,
      color: CustomColors().danger,
      height: 1,
        );
}