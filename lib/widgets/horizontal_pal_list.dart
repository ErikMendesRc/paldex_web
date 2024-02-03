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
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
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

        return pals.isEmpty
            ? Center(
                child: Text(
                  AppTexts.naoEncontramosSeuPal,
                  style: todosOsPal,
                ),
              )
            : SizedBox(
                height: 400.0,
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: pals.length + 1,
                  itemBuilder: (context, index) {
                    if (index < pals.length) {
                      final Pal pal = pals[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PalCard(pal: pal, palID: pal.palId),
                      );
                    } else {
                      return _buildLoader(palProvider);
                    }
                  },
                ),
              );
      },
    );
  }

  Widget _buildLoader(PalProvider palProvider) {
  return Center(
    child: ElevatedButton(
      onPressed: () => palProvider.loadMorePals(),
      child: Text('Load More'),
    ),
  );
}

  void _scrollListener() {
    if (_scrollController.position.extentAfter < 500) {
      Provider.of<PalProvider>(context, listen: false).loadMorePals();
    }
  }
}