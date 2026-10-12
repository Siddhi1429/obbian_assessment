import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../common/hover_builder.dart';
import '../common/safe_image.dart';

class WebHeroSection extends StatelessWidget {
  final VoidCallback? onScrollDown;

  const WebHeroSection({super.key, this.onScrollDown});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 760,
      color: AppColors.black,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Subtle top-right cosmic glow
          Positioned(
            top: -80,
            right: -80,
            child: Container(
              width: 520,
              height: 520,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF0369A1).withValues(alpha: 0.22),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Decorative dotted grid background patterns
          Positioned(
            right: 140,
            top: 70,
            child: _buildDotGrid(rows: 8, cols: 14),
          ),
          Positioned(
            left: 480,
            bottom: 36,
            child: _buildDotGrid(rows: 7, cols: 12),
          ),

          // Main Centered Content
          Align(
            alignment: const Alignment(0, -0.1),
            child: SizedBox(
              width: 1232,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Main Heading: Heading :
                    Text(
                      'Heading :',
                      style: AppTextStyles.display80(color: Colors.white).copyWith(
                        letterSpacing: -1.5,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Body Paragraph (width 672)
                    SizedBox(
                      width: 672,
                      child: Text(
                        'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                        style: AppTextStyles.body18(color: Colors.white).copyWith(
                          fontSize: 17,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Right Interactive Floating Badges (AI Bot Avatar + Action Icon)
          Positioned(
            right: 48,
            bottom: 44,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Floating AI Robot Avatar (Screenshot 1)
                HoverBuilder(
                  builder: (context, isHovered) {
                    return AnimatedScale(
                      scale: isHovered ? 1.08 : 1.0,
                      duration: const Duration(milliseconds: 200),
                      child: Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF0F172A),
                          border: Border.all(
                            color: const Color(0xFF00E5FF),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF00E5FF).withValues(alpha: isHovered ? 0.75 : 0.5),
                              blurRadius: isHovered ? 20 : 14,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: const SafeAssetImage(
                            path: 'assets/images/hero_robot.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 14),

                // Floating Action Arrow Pill (Screenshot 1)
                HoverBuilder(
                  onTap: onScrollDown,
                  builder: (context, isHovered) {
                    return AnimatedScale(
                      scale: isHovered ? 1.08 : 1.0,
                      duration: const Duration(milliseconds: 200),
                      child: Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isHovered ? const Color(0xFF7058FF) : const Color(0xFF5B45E0),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF5B45E0).withValues(alpha: isHovered ? 0.6 : 0.4),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_upward_rounded,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDotGrid({required int rows, required int cols}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        rows,
        (r) => Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            cols,
            (c) => Container(
              margin: const EdgeInsets.all(4),
              width: 2.5,
              height: 2.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
