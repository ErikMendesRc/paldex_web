class WorkSkill {
  final int palWorkSkillsId;
  final String habilidadeTrabalho;

  WorkSkill({
    required this.palWorkSkillsId,
    required this.habilidadeTrabalho,
  });

  factory WorkSkill.fromMap(Map<String, dynamic> map) {
    return WorkSkill(
      palWorkSkillsId: map['palWorkSkillsId'] ?? 0,
      habilidadeTrabalho: map['habilidadeTrabalho'] ?? '',
    );
  }
}