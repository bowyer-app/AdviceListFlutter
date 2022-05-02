import 'package:flutter/material.dart';

class AppColors {
  const AppColors({
    required this.primaryColorDark,
    required this.primaryColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.primaryTextColorAccent,
    required this.primaryObjectColor,
    required this.secondaryObjectColor,
    required this.primaryObjectColorAccent,
    required this.surfaceGray,
    required this.surfaceLightGray,
    required this.surfaceColor,
    required this.surfaceActive,
    required this.surfaceInActive,
    required this.objectPrimary,
    required this.borderGray,
    required this.borderLightGray,
    required this.textDisabled,
    required this.textWhite,
    required this.textGray,
    required this.textActive,
    required this.textInActive,
    required this.objectGray,
    required this.objectThinGray,
    required this.objectLightGray,
    required this.objectActive,
    required this.objectInActive,
    required this.objectMaru,
    required this.objectBatsu,
    required this.objectBlank,
    required this.objectLightBlue,
    required this.chartRed,
    required this.chartBlue,
    required this.error,
  });

  factory AppColors.light() {
    return const AppColors(
      primaryColorDark: Color(0xff64BFDC),
      primaryColor: Color(0xffffffff),
      primaryTextColor: Color(0xff212121),
      secondaryTextColor: Color(0xff666666),
      primaryTextColorAccent: Color(0xff0C3ADC),
      primaryObjectColor: Color(0xff212121),
      secondaryObjectColor: Color(0xffffffff),
      primaryObjectColorAccent: Color(0xff0C3ADC),
      surfaceGray: Color(0xffEDEDED),
      surfaceLightGray: Color(0xffAEAEAE),
      surfaceColor: Color(0xffffffff),
      surfaceActive: Color(0xff666666),
      surfaceInActive: Color(0xffffffff),
      borderGray: Color(0xffE4E4E4),
      borderLightGray: Color(0xffE4E4E4),
      textDisabled: Color(0xffAEAEAE),
      textWhite: Color(0xffffffff),
      textGray: Color(0xff666666),
      textActive: Color(0xffffffff),
      textInActive: Color(0xff666666),
      objectPrimary: Color(0xff212121),
      objectGray: Color(0xff666666),
      objectThinGray: Color(0xffEDEDED),
      objectLightGray: Color(0xffAEAEAE),
      objectActive: Color(0xff666666),
      objectInActive: Color(0xffAEAEAE),
      objectMaru: Color(0xff0C3ADC),
      objectBatsu: Color(0xffD44040),
      objectBlank: Color(0xffAEAEAE),
      objectLightBlue: Color(0xffDFEEFF),
      chartRed: Color(0xffD44040),
      chartBlue: Color(0xff0C3ADC),
      error: Color(0xffff7466),
    );
  }

  factory AppColors.dark() {
    return const AppColors(
      primaryColorDark: Color(0xff212121),
      primaryColor: Color(0xff212121),
      primaryTextColor: Color(0xffffffff),
      secondaryTextColor: Color(0xffEDEDED),
      primaryTextColorAccent: Color(0xff64BFDC),
      primaryObjectColor: Color(0xffffffff),
      secondaryObjectColor: Color(0xffffffff),
      primaryObjectColorAccent: Color(0xff64BFDC),
      surfaceGray: Color(0xff666666),
      surfaceLightGray: Color(0xffAEAEAE),
      surfaceColor: Color(0xff212121),
      surfaceActive: Color(0xff64BFDC),
      surfaceInActive: Color(0xffEDEDED),
      borderGray: Color(0xff666666),
      borderLightGray: Color(0xffEDEDED),
      textDisabled: Color(0xffAEAEAE),
      textWhite: Color(0xffffffff),
      textGray: Color(0xffAEAEAE),
      textActive: Color(0xffffffff),
      textInActive: Color(0xff666666),
      objectPrimary: Color(0xffffffff),
      objectGray: Color(0xff666666),
      objectThinGray: Color(0xff212121),
      objectLightGray: Color(0xffEDEDED),
      objectActive: Color(0xffffffff),
      objectInActive: Color(0xff666666),
      objectMaru: Color(0xffffffff),
      objectBatsu: Color(0xffffffff),
      objectBlank: Color(0xffffffff),
      objectLightBlue: Color(0xff64BFDC),
      chartRed: Color(0xffffffff),
      chartBlue: Color(0xff64BFDC),
      error: Color(0xffff5544),
    );
  }

  final Color primaryColorDark;
  final Color primaryColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color primaryTextColorAccent;
  final Color primaryObjectColor;
  final Color secondaryObjectColor;
  final Color primaryObjectColorAccent;
  final Color surfaceColor;
  final Color surfaceGray;
  final Color surfaceLightGray;
  final Color surfaceActive;
  final Color surfaceInActive;
  final Color borderGray;
  final Color borderLightGray;
  final Color textDisabled;
  final Color textWhite;
  final Color textGray;
  final Color textActive;
  final Color textInActive;
  final Color objectPrimary;
  final Color objectGray;
  final Color objectThinGray;
  final Color objectLightGray;
  final Color objectActive;
  final Color objectInActive;
  final Color objectMaru;
  final Color objectBatsu;
  final Color objectBlank;
  final Color objectLightBlue;
  final Color chartRed;
  final Color chartBlue;
  final Color error;
}
