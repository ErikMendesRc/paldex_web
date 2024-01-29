import 'package:flutter/material.dart';

import '../models/pal_element.dart';

class ElementIcons extends StatelessWidget {
  final List<PalElement> elementos;

  const ElementIcons({required this.elementos, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildElementIcons();
  }

  Widget _buildElementIcons() {
    if (elementos.length == 1) {
      return Image(
        image: AssetImage(getElementIcon(elementos[0].elemento)),
      );
    } else {
      return Row(
        children: elementos.map((elemento) {
          return Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Image(
              image: AssetImage(getElementIcon(elemento.elemento)),
            ),
          );
        }).toList(),
      );
    }
  }

  String getElementIcon(String elemento) {
    // Mapeamento fornecido
    Map<String, String> elementoIconMap = {
      'fire': 'assets/elements/fire.webp',
      'water': 'assets/elements/water.webp',
      'ground': 'assets/elements/ground.png',
      'dark': 'assets/elements/dark.webp',
      'dragon': 'assets/elements/dragon.webp',
      'grass': 'assets/elements/grass.png',
      'ice': 'assets/elements/ice.webp',
      'electric': 'assets/elements/electric.png',
      'neutral': 'assets/elements/neutro.png',
    };

    // Obtém o nome do elemento e converte para minúsculas para garantir correspondência
    String nomeElemento = elemento.toLowerCase();

    // Verifique se o elemento está mapeado, se não estiver, retorne um ícone padrão ou vazio
    return elementoIconMap[nomeElemento] ?? 'assets/images/neutro.png';
  }
}