import 'package:flutter/material.dart';

class CustomRoundedImages extends StatelessWidget {
  final double? width, height;
  final String imageUrl; // Made non-nullable
  final bool applyImagesRadius;
  final BoxBorder? border;
  final BoxFit fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  const CustomRoundedImages({
    super.key,
    this.applyImagesRadius = false,
    this.border,
    this.fit = BoxFit.cover, // Default fit
    this.height,
    this.width,
    required this.imageUrl, // Required to avoid null
    this.isNetworkImage = false,
    this.onPressed,
    this.padding,
    this.borderRadius = 12.0, // Default radius
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImagesRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.circular(0),
          child: Image(
            image: isNetworkImage
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl) as ImageProvider,
            fit: fit,
          ),
        ),
      ),
    );
  }
}
