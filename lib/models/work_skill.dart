class WorkSkill {
  final int palWorkSkillsId;
  final String habilidadeTrabalho;
  final int skillLvl;

  WorkSkill({
    required this.palWorkSkillsId,
    required this.habilidadeTrabalho,
    required this.skillLvl,
  });

  Map<String, dynamic> toMap() {
    return {
      'palWorkSkillsId': palWorkSkillsId,
      'habilidadeTrabalho': habilidadeTrabalho,
      'skillLvl': skillLvl,
    };
  }

  factory WorkSkill.fromMap(Map<String, dynamic> map) {
    return WorkSkill(
      palWorkSkillsId: map['palWorkSkillsId'] ?? 0,
      habilidadeTrabalho: map['habilidadeTrabalho'] ?? '',
      skillLvl: map['skillLvl'] ?? 0
    );
  }
}