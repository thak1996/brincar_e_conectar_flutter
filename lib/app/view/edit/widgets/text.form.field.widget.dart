import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.maxLines,
    this.minLines,
    this.isExpandable = false,
  });

  final TextEditingController? controller;
  final String labelText;
  final String? Function(String?)? validator;
  final int? maxLines;
  final int? minLines;
  final bool isExpandable;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: labelText),
      maxLines: isExpandable ? null : maxLines,
      minLines: isExpandable ? minLines : null,
      validator: validator,
    );
  }
}
