class ProductionCompany {
  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  ProductionCompany({required this.id, required this.logoPath, required this.name, required this.originCountry});

  factory ProductionCompany.fromMap(Map<String, dynamic> map) => ProductionCompany(
    id: map['id'],
    logoPath: map['logo_path'],
    name: map['name'],
    originCountry: map['origin_country'],
  );
}