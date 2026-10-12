import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primaryBlue = Color(0xFF165BE5);
  static const Color primaryBlueDark = Color(0xFF0F46BF);
  static const Color lightBlue = Color(0xFFD6E8FF);
  static const Color lightBlueSoft = Color(0xFFEEF6FF);
  static const Color contactBtnBg = Color(0xFF1A408E);
  static const Color contactBtnBorder = Color(0xFF0066C3);
  static const Color submitBtn = Color(0xFF0F00B7);
  static const Color talentAccent = Color(0xFF0052FF);
  static const Color chipText = Color(0xFF1B3F87);

  static const Color pageBg = Color(0xFFF1F4F9);
  static const Color cardBgLight = Color(0xFFF6F8FC);
  static const Color footerBg = Color(0xFF0F1A2A);
  static const Color darkSectionBg = Color(0xFF0A0E10);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color solutionCardBg = Color(0xC22F2E2E); // rgba(47,46,46,0.76)

  static const Color headingDark = Color(0xFF191B1E);
  static const Color bodyDark = Color(0xFF1E2A3B);
  static const Color cardBody = Color(0xFF0F1A2A);
  static const Color mutedGrey = Color(0xFF6B7280);
  static const Color navText = Color(0xFF94A3B8);
  static const Color footerSub = Color(0xFFDBE2FF);
  static const Color talentTitle = Color(0xFF000033);
  static const Color talentBody = Color(0xFF434656);
  static const Color bodyLight = Color(0xFFF1F4F9);
  static const Color lightGreyText = Color(0xFFD8D8D8);

  static const Color navBorder = Color(0x4D94A3B8); // rgba(148,163,184,0.3)
  static const Color exploreBorder = Color(0xFFC2C0C0);
  static const Color borderLight = Color(0xFFE5E7EB);
  static const Color footerWatermark = Color(0x42FFFFFF); // rgba(255,255,255,0.26)

  static const Color mobileTextDark = Color(0xFF1C1D1F);
  static const Color mobileTextMuted = Color(0xFF8A8E96);
  static const Color mobileBadgeNew = Color(0xFFFFC063);
  static const Color mobileBadgeNewText = Color(0xFF111827);
  static const Color mobileHeading = Color(0xFF1F2937);
  static const Color mobileDivider = Color(0xFFC7C7C7);
  static const Color mobileTabInactive = Color(0xFF3A3D42);
  static const Color homeIndicator = Color(0xFFB9C0C9);

  static const LinearGradient appsSectionGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF111015), Color(0xFF240E4C)],
  );

  static const LinearGradient coreRightGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFE8EBFE), Color(0xFFFAFBFF)],
  );

  static const LinearGradient virvonCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF14111A), Color(0xFF3F2A6F)],
  );

  static const LinearGradient mobileSearchLine = LinearGradient(
    colors: [
      Color(0x17FACC15),
      Color(0xFFFACC15),
      Color(0x4794790C),
    ],
    stops: [0.13, 0.51, 1.0],
  );

  static const LinearGradient autoRideCardGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.426, 0.527, 1.0],
    colors: [Color(0xFFEEF6FF), Color(0xFFFFF8EE), Color(0xFFCDCCCC)],
  );

  static const LinearGradient cabRideCardGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.55, 1.0],
    colors: [
      Color(0xB0ECF4FF),
      Color(0xB0FFF0D9),
      Color(0xB08E9299),
    ],
  );

  static const LinearGradient bikeRideCardGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.77, 0.99],
    colors: [Color(0xFFF1F8FF), Color(0xFFFFEACB), Color(0xFFDDDDDD)],
  );

  static const LinearGradient tabActiveGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFFEDD1), Colors.transparent],
  );
}
