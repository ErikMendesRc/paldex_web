import 'package:flutter/material.dart';
import 'package:paldex/utils/colors/colors.dart';
import 'package:paldex/utils/fonts/fonts.dart';
import 'package:paldex/utils/work_icons.dart';
import 'package:provider/provider.dart';

import '../../models/pal.dart';
import '../../provider/pal_provider.dart';

class CardWorkSkills extends StatelessWidget {
  final int palID;

  const CardWorkSkills({Key? key, required this.palID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palProvider = Provider.of<PalProvider>(context, listen: false);
    return FutureBuilder<Pal>(
      future: palProvider.getPalById(palID),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData) {
          return const Center(
            child: Text('No data available'),
          );
        }
        final Pal pal = snapshot.data!;

        return Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 12,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                color: AppColors.background,
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  spacing: 16.0, // Adjust spacing between items
                  children: pal.workSkills.map((work) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        WorkIcons(works: [work]), // Adjust spacing here
                        Text(
                          'Lvl.${work.skillLvl}',
                          style: AppFonts.textoHabilidade(context),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}