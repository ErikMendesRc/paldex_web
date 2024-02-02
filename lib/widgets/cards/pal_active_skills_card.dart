import 'package:flutter/material.dart';
import 'package:paldex/utils/colors/colors.dart';
import 'package:paldex/utils/fonts/fonts.dart';
import 'package:provider/provider.dart';

import '../../models/pal.dart';
import '../../models/pal_active_skills.dart';
import '../../provider/pal_provider.dart';

class PalActiveSkillsCard extends StatelessWidget {
  final int palID;

  const PalActiveSkillsCard({Key? key, required this.palID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nomeSkill = AppFonts.skillName(context);
    final infoSkill = AppFonts.skillInfos(context);
    final skillLevel = AppFonts.skillLevel(context);

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
        final List<PalActiveSkills> activeSkills = pal.activeSkills;

        return Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: activeSkills.length,
              itemBuilder: (context, index) {
                final activeSkill = activeSkills[index];
                return Column(
                  children: [
                    ListTile(
                      tileColor: AppColors.background,
                      // leading: CircleAvatar(child: Text('A')),
                      title: Text(
                        activeSkill.name,
                        style: nomeSkill,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Descrição: ${activeSkill.description}",
                            style: infoSkill,
                          ),
                          Text(
                            "Poder: ${activeSkill.power}",
                            style: infoSkill,
                          ),
                          Text(
                            "Tempo de Recarga: ${activeSkill.cooldown}",
                            style: infoSkill,
                          ),
                          Text(
                            "Range: ${activeSkill.ranges}",
                            style: infoSkill,
                          ),
                        ],
                      ),
                      trailing: Text(
                        "Lvl.${activeSkill.skillLvl}",
                        style: skillLevel,
                      ),
                    ),
                    const Divider(
                      color: AppColors.terciaryColor,
                      height: 0,
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}