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
      'carnedelamball': 'assets/items/carnelamball.webp',
      'partesdacivilizacaoantiga': 'assets/items/ancientparts.webp',
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
      'fluidosdepal': 'assets/items/fluidopal.webp',
      'anelderesistenciaaagua': 'assets/items/anelresistenciaagua.webp',
      'anelderesistenciaaeletricidade': 'assets/items/anelderesistenciaaraios.webp',
      'cogumelo': 'assets/items/cogumelo.webp',
      'anelderesistenciaaterra': 'assets/items/anelterra.webp',
      'anelderesistenciaaterra+2': 'assets/items/anelterra.webp',
      'orgaocongelante': 'assets/items/orgaogelado.webp',
      'plumadepenking': 'assets/items/plumapenking.webp',
      'esquemadefaixadecabelo4': 'assets/items/esquemafaixapenas4.webp',
      'orgaoeletrico': 'assets/items/orgaoeletrico.webp',
      'anelderesistenciaaogelo' : 'assets/items/anelresistenciagelo.webp',
      'anelderesistenciaaogelo+1' : 'assets/items/anelresistenciagelo.webp',
      'anelderesistenciaaogelo+2' : 'assets/items/anelresistenciagelo.webp',
      'visceraspreciosas' : 'assets/items/preciousentrails.webp',
      'folhadegumoss' : 'assets/items/gumossleaf.webp',
      'osso' : 'assets/items/osso.webp',
      'anelderesistenciaaescuridao' : 'assets/items/anelderesistenciaaescuridao.webp',
      'manualtecnicodealtaqualidade' : 'assets/items/manualtecnicodealtaqualidade.webp',
      'fibra' : 'assets/items/fibra.webp',
      'glanduladeveneno' : 'assets/items/venomgland.webp',
      'almadepalpequeno': 'assets/items/almadepal.webp',
      'carnederushoar' : 'assets/items/carnederushoar.webp',
      'moedadeouro' : 'assets/items/goldcoin.webp',
      'safira' : 'assets/items/safira.webp',
      'anelderesistenciaaagua+1': 'assets/items/anelresistenciaagua.webp',
      'rubi': 'assets/items/rubi.webp',
      'polvora': 'assets/items/polvora.webp',
      'penadetocotoco': 'assets/items/penadetocotoco.webp',
      'sementesdetrigo': 'assets/items/sementesdetrigo.webp',
      'leite': 'assets/items/leite.webp',
      'carnedemozzarina': 'assets/items/carnedemozzarina.webp',
      'anelderesistencia+1': 'assets/items/anelresistencia.webp',
      'sementesdealface': 'assets/items/sementedealface.webp',
      'sementesdetomate': 'assets/items/sementesdetomate.webp',
      'anelderesistenciaagrama+1': 'assets/items/anelgrama.webp',
      'anelderesistenciaagrama+2': 'assets/items/anelgrama.webp',
      'anelderesistenciaaeletricidade+1': 'assets/items/anelderesistenciaaraios.webp',
      'oleodepaldealtaqualidade': 'assets/items/oleodepal.webp',
      'algodaodoce': 'assets/items/algodaodoce.webp',
      'carnedecaprity': 'assets/items/carnedecaprity.webp',
      'chifre': 'assets/items/chifre.webp',
      'carnedeeikthyrdeer' :'assets/items/carnedeeikthyrdeer.webp',
      'anelderesistenciaaterra+1': 'assets/items/anelterra.webp',
      'florbonita': 'assets/items/rosas.webp',
      'anelderesistenciaaofogo+1': 'assets/items/anelresistenciafogo.webp',
      'anelderesistenciaaofogo+2': 'assets/items/anelresistenciafogo.webp',
      'anelderesistenciaaescuridao+1' : 'assets/items/anelderesistenciaaescuridao.webp',
      'anelderesistenciaaescuridao+2' : 'assets/items/anelderesistenciaaescuridao.webp',
      'mel' : 'assets/items/mel.webp',
      'carnededumud': 'assets/items/carnededumud.webp',
      'chavedeprata': 'assets/items/chavedeprata.webp',
      'chavedebronze': 'assets/items/chavedebronze.webp',
      'chavedeouro': 'assets/items/chavedeouro.webp',
      'carnedegaleclaw': 'assets/items/carnedegaleclaw.webp',
      'flecha': 'assets/items/flechas.webp',
      'cajadodaelizabee': 'assets/items/bastaoelizabee.webp',
      'esquemadearmadurademetal4' : 'assets/items/esquemaarmadurametal4.webp',
      'esquemaderoupadepano4': 'assets/items/esquemaderoupadepano4.webp',
      'carnedereindrix': 'assets/items/carnedereindrix.webp',
      'fragmentodepaludio': 'assets/items/paludio.webp',
      'pedradodragaopreciosa': 'assets/items/pedradodragao.webp',
      'minerio': 'assets/items/minerio.webp',
      'bolo': 'assets/items/bolo.webp',
      'sucosuspeito': 'assets/items/sucosuspeito.webp',
      'sucoestranho': 'assets/items/sucoestranho.webp',
      'remedioparaapagarmemoria': 'assets/items/remedioparaapagarmemoria.webp',
      'lingote': 'assets/items/lingote.webp',
      'esquematicodabesta4' : 'assets/items/esquemaarmadurametal4.webp',
      'esquematicodepistola4': 'assets/items/esquemaarmadurametal4.webp',
      'pelodekatress': 'assets/items/pelodekatress.webp',
      'panodealtaqualidade': 'assets/items/pano.webp',
      'pano': 'assets/items/pano.webp',
      'anelderesistenciaadragoes':'assets/items/anelderesistenciaadragoes.webp',
      'anelderesistenciaadragoes+1':'assets/items/anelderesistenciaadragoes.webp',
      'carnedekelpsea':'assets/items/carnedekelpsea.webp',
      'esquemadearmaduradepele4':'assets/items/esquemaarmadurametal4.webp',
      'carnedebroncherry':'assets/items/carnedebroncherry.webp',
      'esquemadearcoantigo4':'assets/items/esquemaarmadurametal4.webp',
      'carnedemammorest' : 'assets/items/carnedemamorrest.webp',
      'esquemadeelmodemetal4':'assets/items/esquemaarmadurametal4.webp',
      'esquemaderifledeassalto4':'assets/items/esquemaarmadurametal4.webp',
      'carvao':'assets/items/carvao.webp',
      'almadepalmedia': 'assets/items/almadepalmedia.webp',
      'lingotedemetaldepal': 'assets/items/lingotepal.webp',
      'quartzopuro': 'assets/items/quartzopuro.webp',
      'polimero': 'assets/items/polimero.webp',
      'esquemadearmadurademetalrefinadoresistenteaocalor4' :'assets/items/esquemaarmadurametal4.webp',
      'esquemadeelmodemetalrefinado4':'assets/items/esquemaarmadurametal4.webp',
      'grandealmadepal': 'assets/items/almadepalgrande.webp',
      'manualtecnicoinovador' : 'assets/items/manualinovador.webp',
      'anelderesistenciaaagua+2': 'assets/items/anelresistenciaagua.webp',
      'esquemadeespingardadeacaoporbomba4' :'assets/items/esquemaarmadurametal4.webp',
      'esquemadearmadurademetalrefinadoresistenteaofrio4' :'assets/items/esquemaarmadurametal4.webp',
      'fibradecarbono' :'assets/items/fibradecarbono.webp',
      'diamante' :'assets/items/diamante.webp',
      'esquemadearmadurademetaldopalresistenteaofrio4':'assets/items/esquemaarmadurametal4.webp',
      'esquemadecapacetemetalicodepal 4':'assets/items/esquemaarmadurametal4.webp',
      'esquemadelancadordefoguetes4' :'assets/items/esquemaarmadurametal4.webp',




    };

    String nomeItem = removeDiacritics(item.toLowerCase());
    nomeItem = nomeItem.replaceAll(' ', '');
    return itemsIconMap[nomeItem] ?? 'assets/images/neutro.png';
  }
}
