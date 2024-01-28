// app_fonts.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paldex/utils/colors/colors.dart';

import '../../models/pal_element.dart';
import '../pal_element_utils.dart';

class AppFonts {

  //TITULO
  static TextStyle title(BuildContext context) {
    return GoogleFonts.jockeyOne(
      fontSize: 40.0,
      color: AppColors.textWhite,
      fontWeight: FontWeight.bold,
      textStyle: Theme.of(context).textTheme.headlineMedium,
    );
  }

  //BEM VINDO
  static TextStyle bemVindo(BuildContext context) {
    return GoogleFonts.jockeyOne(
      fontSize: 64.0,
      color: AppColors.mainText,
      fontWeight: FontWeight.bold,
      textStyle: Theme.of(context).textTheme.headlineMedium,
    );
  }

  //SAIBA TUDO SOBRE SEU PAL FAVORITO
  static TextStyle bodyText(BuildContext context) {
    return GoogleFonts.arimo(
      fontSize: 20.0,
      color: AppColors.mainText,
      textStyle: Theme.of(context).textTheme.bodyMedium,
    );
  }

  //PESQUISAR PALS
  static TextStyle pesquisarPal(BuildContext context) {
    return GoogleFonts.arimo(
      fontSize: 14.0,
      color: AppColors.textGrey,
      textStyle: Theme.of(context).textTheme.bodyMedium,
    );
  }

  //TODOS OS PALS
  static TextStyle todosOsPal(BuildContext context) {
    return GoogleFonts.jockeyOne(
      fontSize: 24.0,
      color: AppColors.mainText,
      textStyle: Theme.of(context).textTheme.bodyMedium,
    );
  }

  //NOME DOS PALS
  static TextStyle nomePals(BuildContext context, List<PalElement> elementos) {
  Color combinedColor = PalElementUtils.getCombinedElementColor(elementos);

  return GoogleFonts.jockeyOne(
    fontSize: 20.0,
    color: combinedColor,
    textStyle: Theme.of(context).textTheme.bodyMedium,
  );
}


  //NUMERO DO PAL
  static TextStyle numeroPal(BuildContext context) {
    return GoogleFonts.jockeyOne(
      fontSize: 18.0,
      color: AppColors.textGrey,
      textStyle: Theme.of(context).textTheme.bodyMedium,
    );
  }

  //HABILIDADES
  static TextStyle habilidade(BuildContext context) {
    return GoogleFonts.jockeyOne(
      fontSize: 20.0,
      color: AppColors.textWhite,
      textStyle: Theme.of(context).textTheme.bodySmall,
    );
  }

  //TEXTO DE HABILIDADES

  static TextStyle textoHabilidade(BuildContext context) {
    return GoogleFonts.arimo(
      fontSize: 12.0,
      color: AppColors.textWhite,
      textStyle: Theme.of(context).textTheme.bodySmall,
    );
  }

  //NUMERO DO PAL
  static TextStyle textoDonate(BuildContext context) {
    return GoogleFonts.arimo(
      fontSize: 15.0,
      color: AppColors.textWhite,
      textStyle: Theme.of(context).textTheme.bodyMedium,
    );
  }
  
  }
