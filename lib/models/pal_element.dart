class PalElement {
  final int id;
  final String elemento;

  PalElement({
    required this.id,
    required this.elemento,
  });

  factory PalElement.fromMap(Map<String, dynamic> map) {
    return PalElement(
      id: map['id'] ?? 0,
      elemento: map['elemento'] ?? '',
    );
  }
}