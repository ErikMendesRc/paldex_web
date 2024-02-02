class PalPartnerSkills {
  final int id;
  final String name;
  final String description;

  PalPartnerSkills({
    required this.id,
    required this.name,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory PalPartnerSkills.fromMap(Map<String, dynamic> map) {
    return PalPartnerSkills(
      id: map['id'],
      name: map['name'],
      description: map['description'],
    );
  }
}