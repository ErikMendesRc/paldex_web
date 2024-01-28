import 'package:flutter/material.dart';

class FoodIconsHorizontal extends StatelessWidget {
  final int quantidadeComida;

  const FoodIconsHorizontal({
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
          padding: EdgeInsets.symmetric(horizontal: 3.0),
          child: Image(
            image: AssetImage('assets/images/food_on.png'),
          ),
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: buildFoodIcons(),
    );
  }
}