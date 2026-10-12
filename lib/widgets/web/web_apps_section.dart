import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../common/hover_builder.dart';
import '../common/safe_image.dart';

class WebAppsSection extends StatelessWidget {
  const WebAppsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 852),
      decoration: const BoxDecoration(
        gradient: AppColors.appsSectionGradient,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Blurred decorative glowing circles
          Positioned(
            left: -100,
            top: -80,
            child: Container(
              width: 508,
              height: 508,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF38157A).withValues(alpha: 0.3),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 80,
            child: Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF1B0C4A).withValues(alpha: 0.4),
              ),
            ),
          ),

          // Main Content
          Center(
            child: Container(
              width: 1232,
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section Heading (w507)
                  SizedBox(
                    width: 507,
                    child: Text(
                      'Heading : Illo sint voluptas. Error voluptates culpa',
                      style: AppTextStyles.headline36(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 50),

                  // Staggered Cards Row
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 1. VIRVON Card (left in Figma, royal sapphire purple velvet)
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: _buildAppCard(
                              title: 'VIRVON',
                              imagePath: 'assets/images/card_virvon.png',
                              bgGradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFF0F172A), Color(0xFF080D1A)],
                              ),
                              vignetteColors: [
                                Colors.transparent,
                                Colors.transparent,
                                const Color(0xFF070B18).withValues(alpha: 0.35),
                                const Color(0xFF050814).withValues(alpha: 0.65),
                              ],
                            ),
                          ),

                          // 2. ABC Apps Card (delivery rider on yellow scooter, natural warm tone)
                          Padding(
                            padding: const EdgeInsets.only(top: 130),
                            child: _buildAppCard(
                              title: 'ABC Apps',
                              imagePath: 'assets/images/card_roju.png',
                              bgGradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFFEAB308), Color(0xFF713F12)],
                              ),
                              vignetteColors: [
                                Colors.transparent,
                                Colors.transparent,
                                const Color(0xFF1C1304).withValues(alpha: 0.3),
                                const Color(0xFF140D02).withValues(alpha: 0.65),
                              ],
                            ),
                          ),

                          // 3. XYZ Apps Card (slate/grey 3D phone render, image clearly visible under text)
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: _buildAppCard(
                              title: 'XYZ Apps',
                              imagePath: 'assets/images/card_xyz.png',
                              bgGradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFFA3AFBE), Color(0xFF475569)],
                              ),
                              vignetteColors: [
                                Colors.transparent,
                                Colors.transparent,
                                const Color(0xFF1E293B).withValues(alpha: 0.25),
                                const Color(0xFF0F172A).withValues(alpha: 0.55),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppCard({
    required String title,
    required String imagePath,
    required Gradient bgGradient,
    required List<Color> vignetteColors,
  }) {
    return HoverBuilder(
      builder: (context, isHovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(0, isHovered ? -12 : 0, 0),
          width: 380,
          height: 560,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: bgGradient,
            border: Border.all(
              color: isHovered
                  ? AppColors.primaryBlue.withValues(alpha: 0.6)
                  : Colors.white.withValues(alpha: 0.1),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isHovered ? 0.45 : 0.25),
                blurRadius: isHovered ? 30 : 20,
                offset: Offset(0, isHovered ? 18 : 10),
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.12),
                blurRadius: 8,
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // 1. Full-bleed Image covering entire card from top to bottom
              Positioned.fill(
                child: SafeAssetImage(
                  path: imagePath,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),

              // 2. Subtle translucent gradient overlay (NOT an opaque container, image shows right through)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: vignetteColors,
                      stops: const [0.0, 0.45, 0.72, 1.0],
                    ),
                  ),
                ),
              ),

              // Text Content Block (width 316)
              Positioned(
                bottom: 36,
                left: 32,
                right: 32,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.headline28(color: Colors.white).copyWith(
                        shadows: [
                          Shadow(
                            color: Colors.black.withValues(alpha: 0.7),
                            blurRadius: 6,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.body16(color: Colors.white.withValues(alpha: 0.88)).copyWith(
                        shadows: [
                          Shadow(
                            color: Colors.black.withValues(alpha: 0.6),
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
