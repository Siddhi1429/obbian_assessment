import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SafeAssetImage extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Alignment alignment;
  final Color? color;
  final BlendMode? colorBlendMode;

  const SafeAssetImage({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.color,
    this.colorBlendMode,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      color: color,
      colorBlendMode: colorBlendMode,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.broken_image_outlined,
            color: Colors.grey.withValues(alpha: 0.4),
            size: (height != null && height! < 40) ? 18 : 28,
          ),
        );
      },
    );
  }
}

class SafeSvgIcon extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final Color? color;

  const SafeSvgIcon({
    super.key,
    required this.path,
    this.width = 24,
    this.height = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
      placeholderBuilder: (context) => SizedBox(
        width: width,
        height: height,
      ),
    );
  }
}
