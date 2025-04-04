import 'package:flutter/material.dart';

class DropdownFormFieldWidget<T> extends StatelessWidget {
  const DropdownFormFieldWidget({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.labelText,
  });

  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      decoration: InputDecoration(labelText: labelText),
      items: items,
      onChanged: onChanged,
    );
  }
}
