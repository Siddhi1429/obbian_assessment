import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';
import '../common/hover_builder.dart';
import '../common/safe_image.dart';

class MobileMapHeader extends StatelessWidget {
  final VoidCallback? onRecenter;

  const MobileMapHeader({super.key, this.onRecenter});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 413,
      child: Stack(
        children: [
          // 1. Map Background Image (map_bg.png)
          const Positioned.fill(
            child: SafeAssetImage(
              path: 'assets/images/map_bg.png',
              fit: BoxFit.cover,
            ),
          ),

          // 2. Location Pill (top: 16, horizontal: 16, width: 343)
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Container(
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.85),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Current location',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.0,
                          letterSpacing: 0,
                          color: const Color(0xFF6B7280),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const SafeAssetImage(
                            path: 'assets/app_icons/weui_location-outlined.png',
                            width: 18,
                            height: 18,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'New City',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              height: 1.0,
                              letterSpacing: 0,
                              color: AppColors.mobileTextDark,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Profile Icon (20x20)
                  const SafeAssetImage(
                    path: 'assets/app_icons/Group 9769.png',
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
            ),
          ),

          // 3. Search Card (top: 232, horizontal: 16, height: 98, radius: 24 - no overlap)
          Positioned(
            top: 232,
            left: 16,
            right: 16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                child: Container(
                  height: 98,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.65),
                      width: 1.2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        blurRadius: 14,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Pick Up input pill
                      _buildSearchPill(
                        iconPath: 'assets/app_icons/Group 9765.png',
                        hintText: 'Pick Up (Default on map)',
                      ),

                      // Where to? input pill
                      _buildSearchPill(
                        iconPath: 'assets/app_icons/Group 9765.png',
                        hintText: 'Where to?',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 4. Direction Floating Button (top: 348, right: 16 - fully separate from search card)
          Positioned(
            right: 16,
            top: 348,
            child: HoverBuilder(
              onTap: onRecenter,
              builder: (context, isHovered) {
                return AnimatedScale(
                  scale: isHovered ? 1.08 : 1.0,
                  duration: const Duration(milliseconds: 150),
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF222B45).withValues(alpha: 0.18),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: const SafeAssetImage(
                      path: 'assets/app_icons/Group.png',
                      width: 13,
                      height: 13,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchPill({
    required String iconPath,
    required String hintText,
  }) {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          SafeAssetImage(
            path: iconPath,
            width: 18,
            height: 18,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              hintText,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.0,
                letterSpacing: 0,
                color: const Color(0xFF6B7280),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
