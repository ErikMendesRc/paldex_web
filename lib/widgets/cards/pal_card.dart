import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paldex/utils/texts/app_texts.dart';
import 'package:paldex/widgets/food_icon_vertical.dart';
import '../../models/pal.dart';
import '../../utils/fonts/fonts.dart';
import '../../utils/pal_element_utils.dart';
import '../element_icons.dart';

class PalCard extends StatelessWidget {
  final Pal pal;
  final int palID;

  const PalCard({
    required this.pal,
    Key? key,
    required this.palID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nomePal = AppFonts.nomePals(context, pal.elementos);
    final elementoText = AppFonts.nomePals(context, pal.elementos);
    final numeroPal = AppFonts.numeroPal(context);
    final habilidade = AppFonts.habilidade(context);
    final textoHabilidade = AppFonts.textoHabilidade(context);
    Color cardColor = PalElementUtils.getCombinedElementColor(pal.elementos);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/detalhes',
          arguments: {'palID': palID},
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: cardColor,
        elevation: 12,
        child: SizedBox(
          width: 300.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
                        ),
                        color: const Color.fromARGB(255, 207, 207, 207),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(14.0),
                          topRight: Radius.circular(14.0),
                        ),
                      ),
                      child: CachedNetworkImage(
                        width: 150,
                        height: 150,
                        imageUrl: pal.imagePath,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          pal.name,
                          style: nomePal,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      left: 12,
                      right: 0,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '#0${pal.numero}',
                          style: numeroPal,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      left: 12,
                      right: 0,
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          AppTexts.elementos,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: elementoText,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      left: 20,
                      right: 0,
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: ElementIcons(elementos: pal.elementos),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      left: 0,
                      right: 10,
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: FoodIcons(quantidadeComida: pal.foodQuantity),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsetsDirectional.only(top: 10.0),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          AppTexts.habilidades,
                          style: habilidade,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          pal.companionAbility,
                          style: textoHabilidade,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
