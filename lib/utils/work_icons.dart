import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:paldex/models/work_skill.dart';

class WorkIcons extends StatelessWidget {
  final List<WorkSkill> works;

  const WorkIcons({required this.works, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildItemsIcons();
  }

  Widget _buildItemsIcons() {
    if (works.length == 1) {
      return Image(
        // width: 70,
        // height: 70,
        image: AssetImage(getWorkSkillIcon(works[0].habilidadeTrabalho)),
      );
    } else {
      return Row(
        children: works.map((item) {
          return Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Image(
              // width: 30,
              // height: 70,
              image: AssetImage(getWorkSkillIcon(item.habilidadeTrabalho)),
            ),
          );
        }).toList(),
      );
    }
  }

  String getWorkSkillIcon(String item) {
    // Mapeamento fornecido
    Map<String, String> workSkillIconMap = {
      'rega': 'assets/workicons/agua.png',
      'fazenda': 'assets/workicons/fazenda.png',
      'acenderfogo': 'assets/workicons/fogo.png',
      'resfriamento': 'assets/workicons/gelo.png',
      'cortararvores': 'assets/workicons/madeira.png',
      'trabalhomanual': 'assets/workicons/mao.png',
      'manipulacao': 'assets/workicons/medicina.png',
      'mineracao': 'assets/workicons/mina.png',
      'plantio': 'assets/workicons/platacao.png',
      'geradordeenergia': 'assets/workicons/raio.png',
      'coleta': 'assets/workicons/reuniao.png',
      'transporte': 'assets/workicons/transporte.png',
      'extracaodeoleo': 'assets/workicons/extrairoleo.webp',
    };

    String nomeSkill = removeDiacritics(item.toLowerCase());
    nomeSkill = nomeSkill.replaceAll(' ', '');
    print(nomeSkill);

    // Verifique se o elemento está mapeado, se não estiver, retorne um ícone padrão ou vazio
    return workSkillIconMap[nomeSkill] ?? 'assets/images/neutro.png';
  }
}
