// app_colors.dart

import 'package:flutter/material.dart';

class AppColors {
  //MAIN APP
  static const Color primaryColor = Color(0xFF22A2E9);
  static const Color secundaryColor = Color(0xFFE7D12A);
  static const Color whiteColor = Colors.white;
  static const Color background = Color.fromARGB(255, 55, 77, 116);
  static const Color terciaryColor = Color.fromARGB(255, 174, 209, 255);
  

  //COLOR CARDS
  static const Color cardWaterIce = Color.fromRGBO(34, 162, 233, 0.5);
  static const Color cardNeutral = Color.fromRGBO(167, 138, 134, 1);
  static const Color cardFire = Color.fromRGBO(255, 160, 26, 0.795);
  static const Color cardLeaf = Color.fromRGBO(135, 196, 84, 0.5);
  static const Color cardEarth = Color.fromRGBO(92, 71, 57, 0.976);
  static const Color cardEletric = Color.fromRGBO(167, 167, 36, 0.855);
  static const Color cardDark = Color.fromRGBO(54, 39, 97, 0.855);
  static const Color cardDragon = Color.fromRGBO(141, 109, 226, 0.855);

  //TEXTS
  static const Color mainText = Color.fromARGB(255, 174, 209, 255);
  static const Color textGrey = Color(0xFF9C9C9C);
  static const Color textWhite = Colors.white;
  static const Color textBlack = Colors.grey;

  //GRADIENTE
  static const LinearGradient appBarGradient = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      Color.fromRGBO(3, 118, 224, 1),
      Color.fromRGBO(60, 199, 239, 1)
    ],
  );

  static Color getColorForElementType(String elementType) {
    switch (elementType) {
      case 'Neutral':
        return cardNeutral;
      case 'Water':
      return cardWaterIce;
      case 'Ice':
        return cardWaterIce;
      case 'Fire':
        return cardFire;
      case 'Grass':
        return cardLeaf;
      case 'Ground':
        return cardEarth;
      case 'Electric':
        return cardEletric;  
      case 'Dark':
        return cardDark;
      case 'Dragon':
        return cardDragon;
      default:
        return Colors.transparent; // Cor padrão ou transparente para casos não previstos
    }
  }
}

