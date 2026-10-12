import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';
import '../common/hover_builder.dart';
import '../common/safe_image.dart';

class MobileTabBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int>? onTabSelected;

  const MobileTabBar({
    super.key,
    this.selectedIndex = 0,
    this.onTabSelected,
  });

  @override
  State<MobileTabBar> createState() => _MobileTabBarState();
}

class _MobileTabBarState extends State<MobileTabBar> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Tabs Bar Row (Height 68)
            SizedBox(
              height: 68,
              child: Row(
                children: [
                  // Tab 0: Car (Active by default, warm cream background)
                  _buildCarTab(
                    isSelected: _currentIndex == 0,
                    onTap: () {
                      setState(() => _currentIndex = 0);
                      widget.onTabSelected?.call(0);
                    },
                  ),

                  // Divider between Tab 0 and rest of tabs
                  Container(
                    width: 1,
                    height: 48,
                    color: const Color(0xFFE5E7EB),
                  ),

                  // Remaining 3 Tabs
                  Expanded(
                    child: Row(
                      children: [
                        _buildStandardTab(
                          index: 1,
                          label: 'Ride 2',
                          imagePath: 'assets/images/ride_auto.png',
                        ),
                        _buildStandardTab(
                          index: 2,
                          label: 'Ride 3',
                          imagePath: 'assets/images/ride_bike.png',
                        ),
                        _buildStandardTab(
                          index: 3,
                          label: 'Ride 3',
                          imagePath: 'assets/images/ride_bike_alt.png',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // iOS-Style Home Indicator Bar (height 18, pill 135x5)
            Container(
              height: 18,
              alignment: Alignment.center,
              child: Container(
                width: 135,
                height: 5,
                decoration: BoxDecoration(
                  color: AppColors.homeIndicator,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarTab({
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return HoverBuilder(
      onTap: onTap,
      builder: (context, isHovered) {
        return Container(
          width: 84,
          height: 68,
          color: isSelected ? const Color(0xFFFAF5EE) : Colors.transparent,
          alignment: Alignment.center,
          child: SafeAssetImage(
            path: 'assets/images/ride_cab.png',
            width: isSelected ? 56 : 34,
            height: isSelected ? 54 : 28,
            fit: BoxFit.contain,
          ),
        );
      },
    );
  }

  Widget _buildStandardTab({
    required int index,
    required String label,
    required String imagePath,
  }) {
    final isSelected = _currentIndex == index;

    return Expanded(
      child: HoverBuilder(
        onTap: () {
          setState(() => _currentIndex = index);
          widget.onTabSelected?.call(index);
        },
        builder: (context, isHovered) {
          return Container(
            height: 68,
            color: isSelected ? const Color(0xFFFAF5EE) : Colors.transparent,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SafeAssetImage(
                  path: imagePath,
                  width: isSelected ? 56 : 34,
                  height: isSelected ? 54 : 28,
                  fit: BoxFit.contain,
                ),
                if (!isSelected) ...[
                  const SizedBox(height: 3),
                  Text(
                    label,
                    style: GoogleFonts.inter(
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      letterSpacing: 0,
                      color: const Color(0xFF6B7280),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
