import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import '../models/obtained_item.dart';

class ItemsIcons extends StatelessWidget {
  final List<ObtainedItem> items;

  const ItemsIcons({required this.items, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildItemsIcons();
  }

  Widget _buildItemsIcons() {
    if (items.length == 1) {
      return Image(
        width: 70,
        height: 70,
        image: AssetImage(getItemsIcons(items[0].itemName)),
      );
    } else {
      return Row(
        children: items.map((item) {
          return Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Image(
              width: 70,
              height: 70,
              image: AssetImage(getItemsIcons(item.itemName)),
            ),
          );
        }).toList(),
      );
    }
  }

  String getItemsIcons(String item) {
    // Mapeamento fornecido
    Map<String, String> itemsIconMap = {
      'la': 'assets/items/la.webp',
      'carnedelambal': 'assets/items/carnelamball.webp',
      'pecasdacivilizacaoantiga': 'assets/items/ancientparts.webp',
      'pelepreciosa': 'assets/items/pelerara.webp',
      'anelderesistencia': 'assets/items/anelresistencia.webp',
      'frutinhasvermelhas': 'assets/items/frutavermelha.webp',
      'garrapreciosa': 'assets/items/garrapreciosa.webp',
      'ovo': 'assets/items/ovo.webp',
      'carnedechikipi': 'assets/items/carnechikipi.webp',
      'plumapreciosa': 'assets/items/plumarara.webp',
      'sementesdefrutasvermelhas': 'assets/items/sementinhasvemelhas.webp',
      'remedioinferior': 'assets/items/remedioinferior.webp',
      'anelderesistenciaagrama': 'assets/items/anelgrama.webp',
      'couro': 'assets/items/couro.webp',
      'orgaodeignicao': 'assets/items/orgaoignicao.webp',
      'anelderesistenciaaofogo': 'assets/items/anelresistenciafogo.webp',
      'fluidodepal': 'assets/items/fluidopal.webp',
      'anelderesistenciaaagua': 'assets/items/anelderesistenciaagua.webp',
      'anelderesistenciaaeletricidade': 'assets/items/neutro.webp',
      'cogumelo': 'assets/items/cogumelo.webp',
      'anelderesistenciaaterra': 'assets/items/anelterra.webp',
      'orgaocongelante': 'assets/items/orgaogelado.webp',
      'plumadepenking': 'assets/items/plumapenking.webp',
      'esquemadefaixadecabelo4': 'assets/items/esquemafaixapenas4.webp',
    };

    String nomeItem = removeDiacritics(item.toLowerCase());
    nomeItem = nomeItem.replaceAll(' ', '');
    print(nomeItem);

    // Verifique se o elemento está mapeado, se não estiver, retorne um ícone padrão ou vazio
    return itemsIconMap[nomeItem] ?? 'assets/images/neutro.png';
  }
}
