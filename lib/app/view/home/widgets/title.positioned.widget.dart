import 'package:flutter/material.dart';

class TitlePositioned extends StatelessWidget {
  const TitlePositioned({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Text(
          'Lista de Brincadeiras',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
