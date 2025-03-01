import 'package:brincar_e_conectar_flutter/app/core/constants/styles.dart';
import 'package:flutter/material.dart';

class AppIcon {
  static double defaultHeight = 40;
  static double defaultWidth = 40;

  static Widget menu({double? size, Color? color}) {
    return Icon(Icons.menu, size: size ?? 32, color: color ?? primaryColor);
  }

  static Widget splash({double? size, Color? color}) {
    return Icon(Icons.diversity_1_outlined, size: size ?? 32, color: color ?? primaryColor);
  }
}
