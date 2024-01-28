import 'package:flutter/material.dart';
import 'package:paldex/utils/colors/colors.dart';
import 'package:provider/provider.dart';

import '../../models/pal.dart';
import '../../provider/pal_provider.dart';
import '../food_icon_horizontal.dart';

class FoodCard extends StatelessWidget {
  final int palID;
  const FoodCard({Key? key, required this.palID}) : super(key: key);

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
        int maxFoodLevels = 10; // Máximo de níveis de fome
        int grayIcons = maxFoodLevels - pal.foodQuantity; // Ícones cinzas a serem exibidos
        grayIcons = grayIcons.clamp(0, maxFoodLevels);

        List<Widget> foodIcons = [];

        // Adicionar ícones de comida existentes
        foodIcons.add(FoodIconsHorizontal(quantidadeComida: pal.foodQuantity));

        // Adicionar ícones cinzas
        foodIcons.addAll(
          List.generate(
            grayIcons,
            (index) => Image.asset('assets/images/food_off.png'),
          ),
        );

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
                  spacing: 3.0, // Ajuste o espaçamento entre os ícones de comida
                  children: foodIcons,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}