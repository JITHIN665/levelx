import 'package:flutter/material.dart';
import 'package:levelx/theme/colors.dart';

AppColors appColor(context) => Theme.of(context).extension<AppColors>()!;

ThemeData getAppTheme(BuildContext context) {
  return ThemeData(
    extensions: const <ThemeExtension<AppColors>>[
      AppColors(
        background: Color(0xffFAFAFA),
        primary: Color(0xffFE8235),
        primaryText: Color(0xff371B34),
        secondaryText: Color(0xff573926),
        ternaryText: Color(0xffF4F2F1),
        text: Color(0xff8A8A8A),
        gridColor: Color(0xffd9d8d8),
      ),
    ],
    fontFamily: 'Manrope',
  );
}
