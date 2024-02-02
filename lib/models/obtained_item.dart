class ObtainedItem {
  final int dropId;
  final String itemName;
  final double dropChance;
  final String dropQuantity;
  final bool bossOnly;

  ObtainedItem({
    required this.dropId,
    required this.itemName,
    required this.dropChance,
    required this.dropQuantity,
    required this.bossOnly,
  });

  Map<String, dynamic> toMap() {
    return {
      'dropId': dropId,
      'itemName': itemName,
      'dropChance': dropChance,
      'dropQuantity': dropQuantity,
      'bossOnly': bossOnly,
    };
  }

  factory ObtainedItem.fromMap(Map<String, dynamic> map) {
    return ObtainedItem(
      dropId: map['dropId'] ?? 0,
      itemName: map['itemName'] ?? '',
      dropChance: map['dropChance'] ?? 0.0,
      dropQuantity: map['dropQuantity'] ?? '',
      bossOnly: map['bossOnly'] ?? false,
    );
  }
}