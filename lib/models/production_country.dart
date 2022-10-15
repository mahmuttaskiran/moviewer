class ProductionCountry {
  final String iso31661;
  final String name;

  ProductionCountry({required this.iso31661, required this.name});

  factory ProductionCountry.fromMap(Map<String, dynamic> map) => ProductionCountry(
    iso31661: map['iso_3166_1'],
    name: map['name'],
  );
}