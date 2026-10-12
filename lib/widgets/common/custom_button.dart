import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import 'hover_builder.dart';
import 'safe_image.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final double height;
  final double? width;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? hoverColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onTap,
    this.height = 48,
    this.width,
    this.borderRadius = 8,
    this.backgroundColor,
    this.hoverColor,
    this.textStyle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final bg = backgroundColor ?? AppColors.primaryBlue;
    final hBg = hoverColor ?? AppColors.primaryBlueDark;

    return HoverBuilder(
      onTap: onTap,
      builder: (context, isHovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.ease,
          height: height,
          width: width,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 24),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isHovered ? hBg : bg,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: bg.withValues(alpha: 0.35),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    )
                  ]
                : [],
          ),
          child: Text(
            text,
            style: textStyle ?? AppTextStyles.button16(),
          ),
        );
      },
    );
  }
}

class LinkButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color color;
  final double fontSize;
  final double gap;
  final bool uppercase;

  const LinkButton({
    super.key,
    required this.text,
    this.onTap,
    this.color = AppColors.primaryBlue,
    this.fontSize = 16,
    this.gap = 14,
    this.uppercase = true,
  });

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      onTap: onTap,
      builder: (context, isHovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.ease,
          height: 48,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  uppercase ? text.toUpperCase() : text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.button16(
                    color: isHovered ? color.withValues(alpha: 0.8) : color,
                    letterSpacing: 0,
                  ).copyWith(fontSize: fontSize),
                ),
              ),
              SizedBox(width: gap),
              AnimatedSlide(
                duration: const Duration(milliseconds: 200),
                curve: Curves.ease,
                offset: isHovered ? const Offset(0.2, 0) : Offset.zero,
                child: SafeSvgIcon(
                  path: 'assets/icons/arrow_forward.svg',
                  width: 24,
                  height: 24,
                  color: isHovered ? color.withValues(alpha: 0.8) : color,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DarkExploreButton extends StatelessWidget {
  final VoidCallback? onTap;

  const DarkExploreButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      onTap: onTap,
      builder: (context, isHovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.ease,
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: isHovered ? const Color(0xFFE5E7EB) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: const Border(
              bottom: BorderSide(color: AppColors.exploreBorder, width: 1),
            ),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.12),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ]
                : [],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'EXPLORE',
                style: AppTextStyles.button16(
                  color: AppColors.headingDark,
                  letterSpacing: 1.0,
                ),
              ),
              Transform.rotate(
                angle: -0.785398, // -45 deg
                child: const SafeSvgIcon(
                  path: 'assets/icons/arrow_forward.svg',
                  width: 22,
                  height: 22,
                  color: AppColors.headingDark,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
