import 'package:flutter/material.dart';
import '../models/pal_element.dart';
import 'colors/colors.dart';

class PalElementUtils {
  static String getCombinedElementNames(List<PalElement> elementos) {
    return elementos.map((element) => element.elemento).join(', ');
  }

  static Color getCombinedElementColor(List<PalElement> elementos) {
    return elementos
        .map((element) => AppColors.getColorForElementType(element.elemento))
        .firstWhere((color) => color != Colors.transparent,
            orElse: () => Colors.black);
  }
}
