import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
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
  late List<Pal> _filteredPals;

  @override
  void initState() {
    Provider.of<PalProvider>(context, listen: false).getAllPals();
    _filteredPals = [];
    super.initState();
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
          noResultsFound = true;
        } else {
          noResultsFound = false;
        }

        return FutureBuilder(
          future: Future.delayed(const Duration(milliseconds: 100)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
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

  void _updateFilteredPals(List<Pal> filteredPals) {
    setState(() {
      _filteredPals = filteredPals;
    });
    _savePalsToLocalStorage(filteredPals); // Salvar no LocalStorage
  }

  void _savePalsToLocalStorage(List<Pal> pals) {
    final List<Map<String, dynamic>> palMaps = pals.map((pal) => pal.toMap()).toList();
    final palJson = json.encode(palMaps);
    html.window.localStorage['pals'] = palJson;
  }

  List<Pal> _loadPalsFromLocalStorage() {
    final palJson = html.window.localStorage['pals'];
    if (palJson != null) {
      final List<dynamic> palList = json.decode(palJson);
      return palList.map((json) => Pal.fromMap(json)).toList();
    } else {
      return [];
    }
  }
}