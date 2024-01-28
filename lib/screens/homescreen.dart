import 'package:flutter/material.dart';
import 'package:paldex/utils/colors/colors.dart';
import 'package:paldex/utils/fonts/fonts.dart';
import 'package:paldex/utils/texts/app_texts.dart';
import 'package:paldex/utils/url_launcher.dart';
import 'package:paldex/widgets/search_bar.dart';
import '../widgets/horizontal_pal_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = AppFonts.title(context);
    final bemVindoStyle = AppFonts.bemVindo(context);
    final saibaSobreSeuPalFavorito = AppFonts.bodyText(context);
    final todosOsPal = AppFonts.todosOsPal(context);

    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppTexts.menssagemBemVindo,
              style: bemVindoStyle,
            ),
            Text(
              AppTexts.saibaSobreSeuPalFavorito,
              style: saibaSobreSeuPalFavorito,
            ),
            const SizedBox(height: 16.0),
            const SearchBarCustom(),
            const SizedBox(height: 16.0),
            Text(
              AppTexts.todosPals,
              style: todosOsPal,
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0), // Ajuste conforme necessário
              child: HorizontalPalList(),
            ),
          ],
        ),
      ),
    );
  }
}
