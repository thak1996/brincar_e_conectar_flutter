import '../../core/constants/styles.dart';
import 'package:flutter/material.dart';

class HomeErrorWidget extends StatelessWidget {
  const HomeErrorWidget({
    super.key,
    this.textButton,
    required this.text,
    required this.onPressed,
  });

  final String? textButton;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(text, style: TextStyle(fontSize: 14)),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: accentColor,
              foregroundColor: primaryColor,
            ),
            onPressed: onPressed,
            child: Text(textButton ?? 'Tentar novamente'),
          ),
        ],
      ),
    );
  }
}
