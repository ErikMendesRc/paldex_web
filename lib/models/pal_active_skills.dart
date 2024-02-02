class PalActiveSkills {
  final int id;
  final String name;
  final String? description;
  final int power;
  final int cooldown;
  final String ranges;
  final int skillLvl;


  PalActiveSkills({
    required this.id,
    required this.name,
    this.description,
    required this.power,
    required this.cooldown,
    required this.ranges,
    required this.skillLvl,
  });
  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'power': power,
      'cooldown': cooldown,
      'ranges': ranges,
      'skillLvl': skillLvl,
    };
  }

  factory PalActiveSkills.fromMap(Map<String, dynamic> map) {
    return PalActiveSkills(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      power: map['power'],
      cooldown: map['cooldown'],
      ranges: map['ranges'],
      skillLvl: map['skillLvl'],
    );
  }
}