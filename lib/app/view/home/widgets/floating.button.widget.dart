import 'package:flutter/material.dart';
import '../../../core/constants/styles.dart';

class FloatingButtonWidget extends StatelessWidget {
  const FloatingButtonWidget(this.onPressed, {super.key});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      shape: const CircleBorder(),
      hoverColor: primaryColor,
      child: const Icon(Icons.add),
    );
  }
}
