import 'package:flutter/material.dart';
import 'package:paldex/widgets/cards/card_workskills.dart';
import 'package:paldex/widgets/cards/food_card.dart';
import 'package:paldex/widgets/cards/horizontal_card_drop.dart';
import 'package:paldex/widgets/cards/pal_details_cards.dart';
import '../utils/colors/colors.dart';
import '../utils/fonts/fonts.dart';
import '../utils/texts/app_texts.dart';
import '../utils/url_launcher.dart';

class PalDetailsScreen extends StatelessWidget {
  final int palID;

  const PalDetailsScreen({Key? key, required this.palID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = AppFonts.title(context);
    final dropItems = AppFonts.dropItems(context);
    final foods = AppFonts.dropItems(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          AppTexts.nomeApp,
          style: titleStyle,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: AppColors.background),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () {
                    UrlLauncher.launchURL();
                  },
                  child: Text(
                    AppTexts.ajudaDonate,
                    style: AppFonts.textoDonate(context),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  color: Colors.white,
                  onPressed: () {
                    UrlLauncher.launchURL();
                  },
                  icon: const Icon(Icons.monetization_on),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: PalCardDetails(palID: palID),
            ),
            const SizedBox(width: 24.0),
            Expanded(
              flex: 3,
              child: SingleChildScrollView( // Adicionando SingleChildScrollView aqui
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppTexts.dropDeItems,
                      style: dropItems,
                    ),
                    const SizedBox(height: 8.0),
                    CardDropItems(palID: palID),
                    const SizedBox(height: 24.0),
                    Text(
                      AppTexts.habilidadeDeTrabalho,
                      style: dropItems,
                    ),
                    const SizedBox(height: 8.0),
                    CardWorkSkills(palID: palID),
                    const SizedBox(height: 24.0),
                    Text(
                      AppTexts.quantidadeComida,
                      style: foods,
                    ),
                    const SizedBox(height: 8.0),
                    FoodCard(palID: palID),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}