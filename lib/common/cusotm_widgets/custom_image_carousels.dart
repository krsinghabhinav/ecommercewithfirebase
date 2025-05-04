
import 'package:flutter/material.dart';

class CustomRoundedImagesCarousel extends StatelessWidget {
  final double? width, height;
  final String? imageUrl;
  
  final bool applyImagesRadius;
  final BoxBorder? border;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double? borderRadius;
  const CustomRoundedImagesCarousel({
    super.key,
    this.applyImagesRadius = false,
    this.border,
    this.fit,
    this.height,
    this.width,
    this.imageUrl,
    this.isNetworkImage = false,
    this.onPressed,
    this.padding,
    this.borderRadius,
   
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        child: ClipRRect(
          borderRadius:
              applyImagesRadius
                  ? BorderRadius.circular(borderRadius!)
                  : BorderRadius.circular(0),
          child: Image(
            image:
                isNetworkImage
                    ? NetworkImage(imageUrl!)
                    : AssetImage(imageUrl!),
            fit: fit!,
          ),
        ),
      ),
    );
  }
}
