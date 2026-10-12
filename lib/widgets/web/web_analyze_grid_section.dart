import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../common/hover_builder.dart';
import '../common/safe_image.dart';

class WebAnalyzeGridSection extends StatelessWidget {
  const WebAnalyzeGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Center(
        child: SizedBox(
          width: 1232,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // 1. Top-Left Dotted Texture (page_4_design.png) starting from top of page and overlapping under image (Ref: SS5)
              const Positioned(
                left: -40,
                top: -80,
                child: SafeAssetImage(
                  path: 'assets/images/page_4_design.png',
                  width: 90,
                  height: 250,
                  fit: BoxFit.fill,
                ),
              ),

              // 2. Bottom-Right Dotted Texture (page_4_design.png) peaking out on right of Peace card
              const Positioned(
                right: -40,
                bottom: -20,
                child: SafeAssetImage(
                  path: 'assets/images/page_4_design.png',
                  width: 85,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),

              // Main Row of Cards
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left Tall 3D Security Cube Card (384x720)
                  _buildTallTechCard(),

                  // Right 2x2 Cards Grid (820 total width)
                  SizedBox(
                    width: 820,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: _buildServiceCard(
                                iconPath: 'assets/icons/experiment.png',
                                iconWidth: 32,
                                iconHeight: 32,
                                title: 'Analyze',
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: _buildServiceCard(
                                iconPath: 'assets/icons/security.png',
                                iconWidth: 26,
                                iconHeight: 32,
                                title: 'Extinguish',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: _buildServiceCard(
                                iconPath: 'assets/icons/altitude.png',
                                iconWidth: 34,
                                iconHeight: 28,
                                title: 'Scale',
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: _buildServiceCard(
                                iconPath: 'assets/icons/stress_management.png',
                                iconWidth: 32,
                                iconHeight: 31,
                                title: 'Peace',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTallTechCard() {
    return HoverBuilder(
      builder: (context, isHovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: 384,
          height: 720,
          transform: Matrix4.translationValues(0, isHovered ? -8 : 0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isHovered ? 0.3 : 0.15),
                blurRadius: isHovered ? 28 : 18,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // 3D Cube image with glowing orange lock
              const SafeAssetImage(
                path: 'assets/images/tech_gradient_bg.png',
                fit: BoxFit.cover,
              ),

              // Bottom gradient darkening
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      const Color(0xFF194AAB).withValues(alpha: 0.3),
                      Colors.black.withValues(alpha: 0.92),
                    ],
                    stops: const [0.35, 0.65, 1.0],
                  ),
                ),
              ),

              // Bottom Text
              Positioned(
                left: 32,
                right: 32,
                bottom: 44,
                child: Text(
                  'Illo sint voluptas. Error voluptates',
                  style: AppTextStyles.headline36(color: Colors.white).copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    height: 1.25,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildServiceCard({
    required String iconPath,
    required double iconWidth,
    required double iconHeight,
    required String title,
  }) {
    return HoverBuilder(
      builder: (context, isHovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 350,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 26),
          decoration: BoxDecoration(
            color: const Color(0xFFDCEBFE),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isHovered ? AppColors.primaryBlue.withValues(alpha: 0.5) : Colors.transparent,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryBlue.withValues(alpha: isHovered ? 0.15 : 0.05),
                blurRadius: isHovered ? 20 : 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row: Icon + Title
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SafeAssetImage(
                    path: iconPath,
                    width: iconWidth,
                    height: iconHeight,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    title,
                    style: AppTextStyles.headline28(color: const Color(0xFF0F172A)).copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Subheading (2 lines bold in SS3)
              Text(
                'Subheading : Illo sint voluptas.',
                style: AppTextStyles.body16(color: const Color(0xFF0F172A)).copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.5,
                ),
              ),
              Text(
                'Error voluptates culpa eligendi.',
                style: AppTextStyles.body16(color: const Color(0xFF0F172A)).copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.5,
                ),
              ),
              const SizedBox(height: 14),

              // Body
              Expanded(
                child: Text(
                  'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.body16(color: const Color(0xFF334155)).copyWith(
                    fontSize: 13,
                    height: 1.5,
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
