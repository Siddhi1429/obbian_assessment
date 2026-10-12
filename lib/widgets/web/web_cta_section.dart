import 'package:flutter/material.dart';
import '../common/safe_image.dart';

class WebCtaSection extends StatelessWidget {
  const WebCtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 720,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background Rocket Image (cta_bg.png)
          const SafeAssetImage(
            path: 'assets/images/cta_bg.png',
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),

          // Gentle Gradient Overlay for optimal contrast on top while keeping mountains vivid
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.5),
                  Colors.black.withValues(alpha: 0.25),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.45, 1.0],
              ),
            ),
          ),

          // Centered Content positioned in top half (matching Screenshot 2)
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 820),
              padding: const EdgeInsets.only(top: 80, left: 24, right: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Heading: Manrope, 36px, SemiBold (600), line-height: 48px, text-align: center
                  Text(
                    'Ready to transformIllo sint voluptas. Error\nvoluptates culpa eligendi. ?',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      height: 48 / 36, // 1.333 line-height
                      letterSpacing: 0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Paragraph: Inter, 16px, Regular (400), line-height: 26px, text-align: center
                  Text(
                    'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 26 / 16, // 1.625 line-height
                      letterSpacing: 0,
                      color: Colors.white.withValues(alpha: 0.9),
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
