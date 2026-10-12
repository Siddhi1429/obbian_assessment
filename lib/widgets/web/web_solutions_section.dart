import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../common/hover_builder.dart';
import '../common/safe_image.dart';

class WebSolutionsSection extends StatelessWidget {
  const WebSolutionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.darkSectionBg,
      child: Stack(
        children: [
          // Background Image (Cosmic Hand with Network Nodes from Screenshot 4)
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: 750,
            child: Opacity(
              opacity: 0.65,
              child: const SafeAssetImage(
                path: 'assets/images/solutions_bg.png',
                fit: BoxFit.cover,
                alignment: Alignment.centerRight,
              ),
            ),
          ),

          // Main Content
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1232),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our comprehensive solutions',
                    style: AppTextStyles.headline36(color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: Text(
                      'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                      style: AppTextStyles.body16(color: AppColors.lightGreyText),
                    ),
                  ),
                  const SizedBox(height: 44),

                  // Cards Grid (Row 1)
                  Row(
                    children: [
                      Expanded(
                        child: _buildSolutionCard(
                          title: 'Data\nEngineering',
                          iconPath: 'assets/images/icon_fire.png',
                          bullets: [
                            'ETL & ELT Pipelines',
                            'Data Warehousing',
                            'Database Design',
                          ],
                        ),
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: _buildSolutionCard(
                          title: 'Cloud\nServices',
                          iconPath: 'assets/images/icon_rocket.png',
                          bullets: [
                            'Microsoft Azure Architecture',
                            'Amazon Server Management',
                            'Operational Resilience',
                          ],
                        ),
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: _buildSolutionCard(
                          title: 'Intelligence &\nBI',
                          iconPath: 'assets/images/icon_borg.png',
                          bullets: [
                            'Power BI Reporting',
                            'Data Analytics',
                            'Predictive Modeling',
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 18, height: 18),

                  // Cards Grid (Row 2)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: _buildSolutionCard(
                          title: 'Social\nMedia',
                          iconPath: 'assets/images/icon_focus.png',
                          bullets: [
                            'Digital Flyer Design',
                            'Social Assets & Campaign Visuals',
                            'Strategic Advisory',
                          ],
                        ),
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: _buildSolutionCard(
                          title: 'Digital\nMarketing',
                          iconPath: 'assets/images/Vector.png',
                          bullets: [
                            'Custom eCommerce Development',
                            'Mobile Commerce',
                            'Platform Migration',
                            'Marketplace Development',
                            'Payment Integration',
                            'Third-Party Integration',
                          ],
                        ),
                      ),
                      const SizedBox(width: 18),
                      // Slot 3: Explore All Link (bottom-aligned in column as in Screenshot 4)
                      Expanded(
                        child: SizedBox(
                          height: 420,
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 28, left: 16),
                              child: InkWell(
                                onTap: () {},
                                hoverColor: Colors.transparent,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Explore All',
                                      style: AppTextStyles.button16(color: const Color(0xFF1D68FE)).copyWith(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Icon(
                                      Icons.arrow_forward,
                                      color: Color(0xFF1D68FE),
                                      size: 18,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
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

  Widget _buildSolutionCard({
    required String title,
    required String iconPath,
    required List<String> bullets,
  }) {
    return HoverBuilder(
      builder: (context, isHovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(0, isHovered ? -6 : 0, 0),
          height: 420,
          padding: const EdgeInsets.all(26),
          decoration: BoxDecoration(
            color: isHovered
                ? const Color(0xFF1A222D).withValues(alpha: 0.92)
                : const Color(0xFF141A22).withValues(alpha: 0.85),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isHovered
                  ? AppColors.primaryBlue.withValues(alpha: 0.5)
                  : Colors.white.withValues(alpha: 0.08),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isHovered ? 0.35 : 0.18),
                blurRadius: isHovered ? 24 : 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon Header (title on left, icon on top-right)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: AppTextStyles.headline28(color: Colors.white).copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 32,
                    height: 32,
                    child: SafeAssetImage(
                      path: iconPath,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              Text(
                'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo.',
                style: AppTextStyles.body16(color: Colors.white.withValues(alpha: 0.8)).copyWith(
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),

              // Bullet items
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: bullets.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 6, right: 8),
                            width: 4,
                            height: 4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              item,
                              style: AppTextStyles.body16(color: Colors.white.withValues(alpha: 0.95)).copyWith(
                                fontSize: 13,
                                height: 1.35,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
