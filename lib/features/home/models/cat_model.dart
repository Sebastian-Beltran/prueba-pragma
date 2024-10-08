import 'package:equatable/equatable.dart';

class CatModel extends Equatable {
  const CatModel({
    required this.id,
    required this.name,
    required this.countryOrigin,
    required this.inteligence,
    required this.adaptability,
    required this.lifeSpan,
    required this.urlInfo,
    required this.description,
    required this.dogFrendly,
    required this.affection,
  });
  final String id;
  final String name;
  final String countryOrigin;
  final int inteligence;
  final int adaptability;
  final String lifeSpan;
  final String? urlInfo;
  final String description;
  final int dogFrendly;
  final int affection;

  factory CatModel.fromJson(Map<String, dynamic> json) {
    return CatModel(
      id: json['id'] as String,
      name: json['name'] as String,
      countryOrigin: json['origin'] as String,
      inteligence: json['intelligence'] as int,
      adaptability: json['adaptability'] as int,
      lifeSpan: json['life_span'] as String,
      urlInfo: json['wikipedia_url'] as String? ?? '',
      description: json['description'] as String,
      dogFrendly: json['dog_friendly'] as int,
      affection: json['affection_level'] as int,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        countryOrigin,
        inteligence,
        adaptability,
        lifeSpan,
        urlInfo,
        description,
        dogFrendly,
        affection,
      ];
}
