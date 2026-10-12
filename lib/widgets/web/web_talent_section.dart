import 'package:flutter/material.dart';
import '../../theme/app_text_styles.dart';
import '../common/hover_builder.dart';
import '../common/safe_image.dart';

class WebTalentSection extends StatelessWidget {
  const WebTalentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 860,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left Half (50% width, Full-Bleed 8th_page.jpg Image, NO white background)
          const Expanded(
            child: SizedBox.expand(
              child: SafeAssetImage(
                path: 'assets/images/8th_page.jpg',
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),

          // Right Half (50% width, Pure White Background with Digital Marketing content)
          Expanded(
            child: Container(
              color: Colors.white,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 620),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Digital Marketing',
                      style: AppTextStyles.headline36(color: const Color(0xFF0F172A)).copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                      style: AppTextStyles.body16(color: const Color(0xFF64748B)).copyWith(
                        fontSize: 13.5,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // 6 Service Cards
                    _buildServiceCard(
                      title: 'Search Engine Optimization (SEO)',
                      iconPath: 'assets/images/talent_icon_1.png',
                    ),
                    _buildServiceCard(
                      title: 'Social Media Marketing',
                      iconPath: 'assets/images/talent_icon_2.png',
                    ),
                    _buildServiceCard(
                      title: 'Performance Marketing',
                      iconPath: 'assets/images/talent_img_105.png',
                    ),
                    _buildServiceCard(
                      title: 'Pay-Per-Click (PPC) Advertising',
                      iconPath: 'assets/images/talent_img_106.png',
                    ),
                    _buildServiceCard(
                      title: 'Content Marketing',
                      iconPath: 'assets/images/talent_img_107.png',
                    ),
                    _buildServiceCard(
                      title: 'Marketing Automation & Lead Generation',
                      iconPath: 'assets/images/talent_img_108.png',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard({
    required String title,
    required String iconPath,
  }) {
    return HoverBuilder(
      builder: (context, isHovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: isHovered ? const Color(0xFFF8FAFC) : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isHovered
                  ? const Color(0xFF1D68FE).withValues(alpha: 0.4)
                  : const Color(0xFFE2E8F0),
              width: 1,
            ),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Blue vertical indicator line on left
              Container(
                width: 3.5,
                height: 34,
                decoration: BoxDecoration(
                  color: const Color(0xFF1D68FE),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 12),

              // Service Icon
              SizedBox(
                width: 24,
                height: 24,
                child: SafeAssetImage(
                  path: iconPath,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 12),

              // Title and Description
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.button16(color: const Color(0xFF0F172A)).copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.body16(color: const Color(0xFF64748B)).copyWith(
                        fontSize: 11.5,
                        height: 1.3,
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
