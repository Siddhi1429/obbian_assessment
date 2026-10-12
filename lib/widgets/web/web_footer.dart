import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../common/hover_builder.dart';
import '../common/safe_image.dart';

class WebFooter extends StatefulWidget {
  const WebFooter({super.key});

  @override
  State<WebFooter> createState() => _WebFooterState();
}

class _WebFooterState extends State<WebFooter> {
  final TextEditingController _emailController = TextEditingController();
  bool _submitted = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.footerBg,
      child: Stack(
        children: [
          // Ribbon Wave Texture Background (footer_bg.png)
          Positioned.fill(
            child: Opacity(
              opacity: 0.85,
              child: const SafeAssetImage(
                path: 'assets/images/footer_bg.png',
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),

          // Main Content
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              child: Container(
                width: 1232,
                padding: const EdgeInsets.only(top: 80, bottom: 60),
                child: Column(
                children: [
                  // Upper Row: Links & Newsletter
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left: Links & Social Icons
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          // Navigation Links
                          Wrap(
                            spacing: 32,
                            runSpacing: 12,
                            children: [
                              _buildFooterLink('Company'),
                              _buildFooterLink('Contact'),
                              _buildFooterLink('Terms of use'),
                              _buildFooterLink('Privacy'),
                              _buildFooterLink('Cookie Policy'),
                            ],
                          ),
                          const SizedBox(height: 36),

                          // 6 Social Media Icons (Facebook, Instagram, X, GitHub, Dribbble, LinkedIn)
                          Row(
                            children: const [
                              'assets/icons/social_4.svg', // Facebook
                              'assets/icons/social_3.svg', // Instagram
                              'assets/icons/social_1.svg', // X
                              'assets/icons/social_6.svg', // GitHub
                              'assets/icons/social_dribbble.svg', // Dribbble
                              'assets/icons/social_2.svg', // LinkedIn
                            ].map((iconPath) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: HoverBuilder(
                                  builder: (context, isHovered) {
                                    return AnimatedScale(
                                      scale: isHovered ? 1.15 : 1.0,
                                      duration: const Duration(milliseconds: 200),
                                      child: SafeSvgIcon(
                                        path: iconPath,
                                        width: 22,
                                        height: 22,
                                        color: isHovered ? AppColors.primaryBlue : Colors.white.withValues(alpha: 0.85),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 32),
                    // Right: Subscribe Newsletter
                      SizedBox(
                        width: 420,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Subscribe',
                              style: AppTextStyles.sub20(color: Colors.white).copyWith(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Select topics and stay current with our latest insights',
                              style: AppTextStyles.body16(color: AppColors.footerSub).copyWith(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Email Input & Submit Button Row
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                        color: const Color(0xFFD1D5DB),
                                        width: 1,
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.add,
                                          size: 18,
                                          color: AppColors.mutedGrey,
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: TextField(
                                            controller: _emailController,
                                            style: AppTextStyles.body16(color: AppColors.headingDark).copyWith(fontSize: 14),
                                            decoration: const InputDecoration(
                                              hintText: 'you@example.com',
                                              hintStyle: TextStyle(
                                                color: AppColors.mutedGrey,
                                                fontSize: 14,
                                              ),
                                              border: InputBorder.none,
                                              isDense: true,
                                              contentPadding: EdgeInsets.zero,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),

                                // Submit Button
                                HoverBuilder(
                                  onTap: () {
                                    if (_emailController.text.isNotEmpty) {
                                      setState(() => _submitted = true);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Subscribed successfully!')),
                                      );
                                    }
                                  },
                                  builder: (context, isHovered) {
                                    return AnimatedContainer(
                                      duration: const Duration(milliseconds: 200),
                                      width: 86,
                                      height: 40,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: isHovered
                                            ? const Color(0xFF2214C9)
                                            : AppColors.submitBtn,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        _submitted ? 'Done' : 'Submit',
                                        style: AppTextStyles.label12(color: Colors.white).copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 90),

                  // Watermark Centered at Bottom
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'TC Teach Company',
                      style: AppTextStyles.orbitronWatermark(
                        fontSize: 96,
                        color: Colors.white.withValues(alpha: 0.18),
                      ),
                    ),
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

  Widget _buildFooterLink(String title) {
    return HoverBuilder(
      builder: (context, isHovered) {
        return Text(
          title,
          style: AppTextStyles.body16(
            color: isHovered ? Colors.white : const Color(0xFFD1D5DB),
          ).copyWith(fontSize: 15),
        );
      },
    );
  }
}
