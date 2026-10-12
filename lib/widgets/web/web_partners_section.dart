import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../common/safe_image.dart';

class WebPartnersSection extends StatelessWidget {
  const WebPartnersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 720,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left Half (50% width, Pure White Background with neatly aligned content)
          Expanded(
            child: Container(
              color: Colors.white,
              alignment: Alignment.centerRight,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 600),
                padding: const EdgeInsets.only(left: 48, right: 64, top: 48, bottom: 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Heading: Illo sint voluptas. Error\nvoluptates culpa eligendi.',
                      style: AppTextStyles.headline36(color: AppColors.headingDark).copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Partner Cloud Logos Row (Azure, Google Cloud, AWS)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 56,
                          height: 48,
                          child: SafeAssetImage(
                            path: 'assets/images/logo_1.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 28),
                        const SizedBox(
                          width: 64,
                          height: 48,
                          child: SafeSvgIcon(
                            path: 'assets/icons/logo_google_cloud.svg',
                          ),
                        ),
                        const SizedBox(width: 28),
                        const SizedBox(
                          width: 90,
                          height: 48,
                          child: SafeAssetImage(
                            path: 'assets/images/logo_3.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),

                    Text(
                      'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                      style: AppTextStyles.body16(color: const Color(0xFF475569)).copyWith(
                        fontSize: 14.5,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 32),

                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1D68FE),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'EXPLORE',
                        style: AppTextStyles.button16(color: Colors.white).copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Right Half (50% width, Full-Bleed Earth Image, NO white background)
          const Expanded(
            child: SizedBox.expand(
              child: SafeAssetImage(
                path: 'assets/images/partners_image.png',
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
