import 'package:flutter/material.dart';

class CustomeTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomeTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
