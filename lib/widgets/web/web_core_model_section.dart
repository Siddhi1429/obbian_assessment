import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../common/custom_button.dart';
import '../common/hover_builder.dart';
import '../common/safe_image.dart';

class WebCoreModelSection extends StatelessWidget {
  const WebCoreModelSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 852),
      color: AppColors.pageBg,
      child: Center(
        child: Container(
          width: 1232,
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left Column: Text & CTA
              SizedBox(
                width: 443,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Heading',
                      style: AppTextStyles.headline36(color: AppColors.headingDark),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                      style: AppTextStyles.body16(color: AppColors.bodyDark),
                    ),
                    const SizedBox(height: 32),
                    PrimaryButton(
                      text: 'LEARN MORE',
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              // Right Column: Concentric Circles Visual & Chips
              SizedBox(
                width: 650,
                height: 650,
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    // Concentric rings image from Figma (Frame 1171276467.png)
                    const Positioned.fill(
                      child: SafeAssetImage(
                        path: 'assets/images/core_rings.png',
                        fit: BoxFit.contain,
                      ),
                    ),

                    // Chip 1: Enabled (Top-Left)
                    Positioned(
                      left: 140,
                      top: 130,
                      child: _buildChip(
                        label: 'Enabled',
                        iconPath: 'assets/icons/icon_hdr_weak.svg',
                      ),
                    ),

                    // Chip 2: Clean (Top-Right)
                    Positioned(
                      right: 180,
                      top: 130,
                      child: _buildChip(
                        label: 'Clean',
                        iconPath: 'assets/icons/icon_diamond_shine.svg',
                      ),
                    ),

                    // Chip 3: Reliable (Bottom-Left)
                    Positioned(
                      left: 150,
                      bottom: 130,
                      child: _buildChip(
                        label: 'Reliable',
                        iconPath: 'assets/icons/icon_verified.svg',
                      ),
                    ),

                    // Chip 4: Organized (Bottom-Right)
                    Positioned(
                      right: 170,
                      bottom: 130,
                      child: _buildChip(
                        label: 'Organized',
                        iconPath: 'assets/icons/icon_shuffle.svg',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip({required String label, required String iconPath}) {
    return HoverBuilder(
      builder: (context, isHovered) {
        return AnimatedScale(
          scale: isHovered ? 1.08 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon Circle (64x64, radius 56, 8px border #D6E8FF)
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: AppColors.lightBlue,
                    width: 6,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryBlue.withValues(alpha: 0.12),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: SafeSvgIcon(
                  path: iconPath,
                  width: 28,
                  height: 28,
                  color: AppColors.chipText,
                ),
              ),
              const SizedBox(height: 8),

              // Label Pill
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.95),
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  label,
                  style: AppTextStyles.label12(color: AppColors.chipText).copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
