import '../../models/pal.dart';
import '../utils/texts/app_texts.dart';

class PalAttributesController {
  final Pal pal;

  PalAttributesController({required this.pal});

  List<String> getPalAttributes() {
    return [
      pal.size.toString(),
      pal.rarity.toString(),
      pal.hp.toString(),
      pal.meleeAttack.toString(),
      pal.magicAttack.toString(),
      pal.defense.toString(),
      pal.support.toString(),
      pal.craftingSpeed.toString(),
      pal.captureRate.toString(),
      pal.price.toString(),
      pal.slowWalkSpeed.toString(),
      pal.runSpeed.toString(),
      pal.sprintSpeed.toString(),
      pal.maleProbability.toString(),
    ];
  }

  static List<String>getNameAttributes(){
    return [
      AppTexts.tamanho,
      AppTexts.raridade,
      AppTexts.hp,
      AppTexts.ataqueCorpoACorpo,
      AppTexts.ataqueMagico,
      AppTexts.defesa,
      AppTexts.apoiar,
      AppTexts.craftSpeed,
      AppTexts.taxaDeCaptura,
      AppTexts.preco,
      AppTexts.velocidadeDeCaminhada,
      AppTexts.velocidadeDeCorrida,
      AppTexts.rideSprint,
      AppTexts.probabilidadeMasculina,
    ];
  }
}
