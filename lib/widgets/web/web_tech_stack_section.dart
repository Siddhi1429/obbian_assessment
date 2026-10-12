import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../common/custom_button.dart';
import '../common/hover_builder.dart';

class WebTechStackSection extends StatelessWidget {
  const WebTechStackSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.black,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Center(
        child: SizedBox(
          width: 1232,
          child: Row(
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

                    PrimaryButton(
                      text: 'LEARN MORE',
                      onTap: () {},
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
        ),
      ),
    );
  }

  Widget _buildTechBadge({required String category, required String tech}) {
    return HoverBuilder(
      builder: (context, isHovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 140,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          decoration: BoxDecoration(
            color: isHovered ? const Color(0xFF1E242B) : const Color(0xFF111418),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isHovered
                  ? AppColors.primaryBlue.withValues(alpha: 0.5)
                  : Colors.white.withValues(alpha: 0.08),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isHovered ? 0.35 : 0.15),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                category,
                style: AppTextStyles.label12(color: AppColors.navText).copyWith(
                  fontSize: 11,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                tech,
                style: AppTextStyles.button16(color: Colors.white).copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
