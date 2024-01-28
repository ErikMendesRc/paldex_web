import 'package:flutter/material.dart';
import 'package:paldex/models/pal.dart';
import 'package:paldex/utils/texts/app_texts.dart';
import 'package:provider/provider.dart';

import '../provider/pal_provider.dart';
import '../utils/fonts/fonts.dart';
import 'cards/pal_card.dart';

class HorizontalPalList extends StatefulWidget {
  @override
  _HorizontalPalListState createState() => _HorizontalPalListState();
}

class _HorizontalPalListState extends State<HorizontalPalList> {
  bool noResultsFound = false;

  @override
  void initState() {
    super.initState();
    Provider.of<PalProvider>(context, listen: false).getAllPals();
  }

  @override
  Widget build(BuildContext context) {
    final todosOsPal = AppFonts.todosOsPal(context);
    
    return Consumer<PalProvider>(
      builder: (context, palProvider, child) {
        final List<Pal> pals = palProvider.filteredPals.isNotEmpty
            ? palProvider.filteredPals
            : palProvider.pals;

        if (pals.isEmpty) {
          // Se não houver resultados, definimos a flag noResultsFound como true
          noResultsFound = true;
        } else {
          noResultsFound = false;
        }

        return FutureBuilder(
          // Utilizando FutureBuilder para aguardar 5 segundos antes de mostrar o texto
          future: Future.delayed(Duration(seconds: 1)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Mostrando o CircularProgressIndicator enquanto aguarda
              return Center(child: CircularProgressIndicator());
            } else {
              // Após 5 segundos, decidimos se exibimos o texto ou a lista
              return noResultsFound
                  ? Center(
                      child: Text(
                        AppTexts.naoEncontramosSeuPal,
                        style: todosOsPal,
                      ),
                    )
                  : SizedBox(
                      height: 400.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: pals.length,
                        itemBuilder: (context, index) {
                          final Pal pal = pals[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PalCard(pal: pal, palID: pal.palId),
                          );
                        },
                      ),
                    );
            }
          },
        );
      },
    );
  }
}
