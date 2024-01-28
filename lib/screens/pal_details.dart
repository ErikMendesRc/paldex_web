import 'package:flutter/material.dart';
import 'package:paldex/widgets/cards/pal_details_cards.dart';
import '../utils/colors/colors.dart';
import '../utils/fonts/fonts.dart';
import '../utils/texts/app_texts.dart';
import '../utils/url_launcher.dart';

class PalDetailsScreen extends StatelessWidget {
  final int palID;

  const PalDetailsScreen({super.key, required this.palID});

  @override
  Widget build(BuildContext context) {
    final titleStyle = AppFonts.title(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppTexts.nomeApp,
          style: titleStyle,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: AppColors.appBarGradient),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                Text(AppTexts.ajudaDonate,
                    style: AppFonts.textoDonate(context)),
                const SizedBox(width: 8),
                IconButton(
                    color: Colors.white,
                    onPressed: () {
                      UrlLauncher.launchURL();
                    },
                    icon: const Icon(Icons.monetization_on))
              ],
            ),
          ),
        ],
      ),
      body: Container(
        child: PalCardDetails(palID: palID),
      ),
    );
  }
}