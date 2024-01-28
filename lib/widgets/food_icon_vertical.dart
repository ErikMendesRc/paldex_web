import 'package:flutter/material.dart';

class FoodIcons extends StatelessWidget {
  final int quantidadeComida;

  const FoodIcons({
    required this.quantidadeComida,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int maxComida = 10;

    List<Widget> buildFoodIcons() {
      return List.generate(
        quantidadeComida.clamp(0, maxComida),
        (index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 2.0),
          child: Image(
            image: AssetImage('assets/images/food_on.png'),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: buildFoodIcons(),
    );
  }
}