import 'package:flutter/widgets.dart';

class CustomtextWidget extends StatelessWidget {
  final String title;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxline;

  const CustomtextWidget({
    super.key,
    required this.title,
    this.fontWeight,
    this.color,
    this.fontSize,
    this.textAlign,
    this.textOverflow,
    this.maxline,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: textOverflow,
      maxLines: maxline,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}
