import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../common/hover_builder.dart';

class WebHeader extends StatelessWidget {
  final Function(String section)? onNavSelect;

  const WebHeader({super.key, this.onNavSelect});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: const BoxDecoration(
        color: AppColors.black,
        border: Border(
          bottom: BorderSide(
            color: AppColors.navBorder,
            width: 0.5,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final content = Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            // Logo: TC Teach Company
            HoverBuilder(
              onTap: () => onNavSelect?.call('hero'),
              builder: (context, isHovered) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'TC',
                      style: AppTextStyles.orbitron24(
                        color: isHovered ? AppColors.primaryBlue : Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Teach Company',
                      style: AppTextStyles.headline28().copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 2.4,
                      ),
                    ),
                  ],
                );
              },
            ),

            // Right: Navigation Links and Contact Us Button Together
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildNavItem('Products'),
                _buildNavItem('Solutions'),
                _buildNavItem('Partnerships'),
                _buildNavItem('Company'),
                const SizedBox(width: 20),

                // Contact Us Button with subtle blue glow
                HoverBuilder(
                  onTap: () => onNavSelect?.call('contact'),
                  builder: (context, isHovered) {
                    return Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        // Glow effect
                        Positioned(
                          bottom: -4,
                          child: Container(
                            width: 70,
                            height: 12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF0066C3).withValues(alpha: isHovered ? 0.9 : 0.6),
                                  blurRadius: isHovered ? 18 : 12,
                                  spreadRadius: isHovered ? 3 : 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Button body
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 104,
                          height: 38,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isHovered ? const Color(0xFF124EC9) : AppColors.primaryBlue,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xFF3B82F6),
                              width: 0.5,
                            ),
                          ),
                          child: Text(
                            'Contact Us',
                            style: AppTextStyles.label12(color: Colors.white).copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              letterSpacing: -0.1,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        );

        if (constraints.maxWidth < 1180) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            child: SizedBox(
              width: 1180,
              child: content,
            ),
          );
        }
        return content;
      },
    ),
  );
}

  Widget _buildNavItem(String title) {
    return HoverBuilder(
      onTap: () => onNavSelect?.call(title.toLowerCase()),
      builder: (context, isHovered) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Text(
            title,
            style: AppTextStyles.nav14(
              color: isHovered ? Colors.white : AppColors.navText,
            ),
          ),
        );
      },
    );
  }
}
