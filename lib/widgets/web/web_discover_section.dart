import 'package:flutter/material.dart';
import '../../theme/app_text_styles.dart';
import '../common/safe_image.dart';

class WebDiscoverSection extends StatelessWidget {
  const WebDiscoverSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1232),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Discover more: Explore',
                style: AppTextStyles.headline36(color: const Color(0xFF0F172A)).copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 36),

              // Row 1: Careers & Partners (2 cards)
              Row(
                children: [
                  // Card 1: Careers
                  Expanded(
                    child: _buildDiscoverCard(
                      imagePath: 'assets/images/discover_careers.png',
                      imageWidth: 230,
                      category: 'CAREERS',
                      title: 'Join our team',
                      linkText: 'EXPLORE CAREERS',
                    ),
                  ),
                  const SizedBox(width: 24),
                  // Card 2: Partners
                  Expanded(
                    child: _buildDiscoverCard(
                      imagePath: 'assets/images/discover_partners.png',
                      imageWidth: 230,
                      category: 'PARTNERS',
                      title: 'Collaborate for growth:',
                      linkText: 'BECOME A PARTNER',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Row 2: Resources (1 wide full card matching Figma screenshot)
              _buildDiscoverCard(
                imagePath: 'assets/images/discover_resources.png',
                imageWidth: 520,
                category: 'RESOURCES',
                title: 'Beyond the firewall: Resources from Obbian',
                linkText: 'ACCESS RESOURCES',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDiscoverCard({
    required String imagePath,
    required double imageWidth,
    required String category,
    required String title,
    required String linkText,
  }) {
    return Container(
      height: 240,
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
          width: 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left Side: Image
          SizedBox(
            width: imageWidth,
            child: SafeAssetImage(
              path: imagePath,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),

          // Right Side: Content Block
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category,
                        style: AppTextStyles.label12(color: const Color(0xFF64748B)).copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        title,
                        style: AppTextStyles.sub20(color: const Color(0xFF0F172A)).copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.body16(color: const Color(0xFF64748B)).copyWith(
                          fontSize: 13,
                          height: 1.45,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          linkText,
                          style: AppTextStyles.button16(color: const Color(0xFF1D68FE)).copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.4,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.arrow_forward,
                          size: 14,
                          color: Color(0xFF1D68FE),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
