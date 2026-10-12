import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle display80({Color color = Colors.white}) =>
      GoogleFonts.manrope(
        fontSize: 80,
        fontWeight: FontWeight.w800,
        height: 88 / 80,
        letterSpacing: -0.8,
        color: color,
      );

  static TextStyle headline36({Color color = AppColors.headingDark}) =>
      GoogleFonts.manrope(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        height: 48 / 36,
        letterSpacing: 0,
        color: color,
      );

  static TextStyle headline28({Color color = Colors.white}) =>
      GoogleFonts.manrope(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        height: 36 / 28,
        letterSpacing: 0,
        color: color,
      );

  static TextStyle sub20({Color color = AppColors.headingDark}) =>
      GoogleFonts.manrope(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 28 / 20,
        letterSpacing: 0,
        color: color,
      );

  static TextStyle button16({Color color = Colors.white, double letterSpacing = 1.0}) =>
      GoogleFonts.manrope(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: letterSpacing,
        color: color,
      );

  static TextStyle label12({Color color = AppColors.headingDark}) =>
      GoogleFonts.manrope(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        color: color,
      );

  static TextStyle body18({Color color = AppColors.bodyDark}) =>
      GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 26 / 18,
        letterSpacing: 0,
        color: color,
      );

  static TextStyle body16({Color color = AppColors.bodyDark}) =>
      GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 26 / 16,
        letterSpacing: 0,
        color: color,
      );

  static TextStyle nav14({Color color = AppColors.navText}) =>
      GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 24 / 14,
        letterSpacing: 0,
        color: color,
      );

  static TextStyle orbitron24({Color color = Colors.white}) =>
      GoogleFonts.orbitron(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        letterSpacing: 2.4,
        color: color,
      );

  static TextStyle orbitron96({Color color = AppColors.footerWatermark}) =>
      GoogleFonts.orbitron(
        fontSize: 96,
        fontWeight: FontWeight.w400,
        height: 1.0,
        letterSpacing: 9.6,
        color: color,
      );

  static TextStyle orbitronWatermark({
    Color color = AppColors.footerWatermark,
    double fontSize = 48,
  }) =>
      GoogleFonts.orbitron(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        height: 1.0,
        letterSpacing: fontSize * 0.10,
        color: color,
      );

  static TextStyle hanken48Bold({Color color = AppColors.talentTitle}) =>
      GoogleFonts.hankenGrotesk(
        fontSize: 48,
        fontWeight: FontWeight.w700,
        height: 56 / 48,
        letterSpacing: -0.96,
        color: color,
      );

  static TextStyle jakarta18Bold({Color color = AppColors.mobileHeading}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 28 / 18,
        color: color,
      );

  static TextStyle jakarta16Bold({Color color = AppColors.mobileHeading}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        height: 20 / 16,
        color: color,
      );

  static TextStyle jakarta14Bold({Color color = AppColors.mobileHeading}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        height: 20 / 14,
        color: color,
      );

  static TextStyle jakarta10Regular({Color color = AppColors.mutedGrey}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 10,
        fontWeight: FontWeight.w700,
        height: 15 / 10,
        color: color,
      );

  static TextStyle jakarta10Badge({Color color = AppColors.mobileBadgeNewText}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 10,
        fontWeight: FontWeight.w900,
        height: 15 / 10,
        letterSpacing: 0.5,
        color: color,
      );
}
