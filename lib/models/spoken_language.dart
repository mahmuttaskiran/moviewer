class SpokenLanguage {
  final String name;
  final String iso6391;

  SpokenLanguage({required this.name, required this.iso6391});

  factory SpokenLanguage.fromMap(Map<String, dynamic> json) => SpokenLanguage(
    name: json['name'],
    iso6391: json['iso_639_1'],
  );
}
