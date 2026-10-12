import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../common/hover_builder.dart';
import '../common/safe_image.dart';

class WebDesignBrandingSection extends StatelessWidget {
  const WebDesignBrandingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.black,
      child: Stack(
        children: [
          // Background glowing curved lights (tech_curves_bg.png) filling entire section seamlessly
          Positioned.fill(
            child: const SafeAssetImage(
              path: 'assets/images/tech_curves_bg.png',
              fit: BoxFit.cover,
              alignment: Alignment.centerLeft,
            ),
          ),

          // Main Content
          Center(
            child: Container(
              width: 1232,
              padding: const EdgeInsets.symmetric(vertical: 90),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading
                  Text(
                    'Design & Branding',
                    style: AppTextStyles.headline36(color: Colors.white),
                  ),
                  const SizedBox(height: 16),

                  // Paragraph
                  SizedBox(
                    width: 720,
                    child: Text(
                      'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                      style: AppTextStyles.body16(color: AppColors.lightGreyText),
                    ),
                  ),
                  const SizedBox(height: 48),

                  // 3 White Cards
                  Row(
                    children: [
                      Expanded(
                        child: _buildDesignCard(
                          title: 'UI/UX Design',
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: _buildDesignCard(
                          title: 'Visual Branding',
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: _buildDesignCard(
                          title: 'Brand Materials',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 110),

                  // Lower Part: Advanced Development Stack (Seamlessly in same section as in SS2)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left Column (Text & Sub-items)
                      SizedBox(
                        width: 520,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Advanced Development\nStack',
                              style: AppTextStyles.headline36(color: Colors.white),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                              style: AppTextStyles.body16(color: AppColors.lightGreyText),
                            ),
                            const SizedBox(height: 28),

                            // Sub-item 1: Web Development
                            Text(
                              'Web Development',
                              style: AppTextStyles.button16(color: Colors.white),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                              style: AppTextStyles.body16(color: AppColors.navText).copyWith(fontSize: 14),
                            ),
                            const SizedBox(height: 24),

                            // Sub-item 2: Mobile App Development
                            Text(
                              'Mobile App Development',
                              style: AppTextStyles.button16(color: Colors.white),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                              style: AppTextStyles.body16(color: AppColors.navText).copyWith(fontSize: 14),
                            ),
                            const SizedBox(height: 36),

                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1D68FE),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                'LEARN MORE',
                                style: AppTextStyles.button16(color: Colors.white).copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Right Column: 2x3 Tech Badges
                      SizedBox(
                        width: 600,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(child: _buildTechBadge(category: 'DESIGN', tech: 'Figma')),
                                const SizedBox(width: 16),
                                Expanded(child: _buildTechBadge(category: 'LOGIC', tech: 'Python')),
                                const SizedBox(width: 16),
                                Expanded(child: _buildTechBadge(category: 'BACKEND', tech: 'Node.js')),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(child: _buildTechBadge(category: 'FRONTEND', tech: 'React')),
                                const SizedBox(width: 16),
                                Expanded(child: _buildTechBadge(category: 'CROSS-PLATFORM', tech: 'Flutter')),
                                const SizedBox(width: 16),
                                Expanded(child: _buildTechBadge(category: 'LANGUAGE', tech: 'Dart')),
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
        ],
      ),
    );
  }

  Widget _buildTechBadge({required String category, required String tech}) {
    return HoverBuilder(
      builder: (context, isHovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 140,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isHovered ? const Color(0xFF1E293B) : const Color(0xFF0F172A).withValues(alpha: 0.75),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isHovered ? AppColors.primaryBlue.withValues(alpha: 0.6) : Colors.white.withValues(alpha: 0.08),
              width: 1,
            ),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: AppColors.primaryBlue.withValues(alpha: 0.2),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                category,
                textAlign: TextAlign.center,
                style: AppTextStyles.label12(color: AppColors.mutedGrey).copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                tech,
                textAlign: TextAlign.center,
                style: AppTextStyles.headline28(color: Colors.white).copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDesignCard({required String title}) {
    return HoverBuilder(
      builder: (context, isHovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(0, isHovered ? -8 : 0, 0),
          height: 280,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isHovered ? 0.35 : 0.18),
                blurRadius: isHovered ? 24 : 14,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.headline28(color: AppColors.headingDark),
              ),
              const SizedBox(height: 18),
              Expanded(
                child: Text(
                  'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                  style: AppTextStyles.body16(color: AppColors.cardBody),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
