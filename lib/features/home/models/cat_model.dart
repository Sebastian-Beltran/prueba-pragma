import 'package:equatable/equatable.dart';

class CatModel extends Equatable {
  const CatModel({
    required this.id,
    required this.name,
    required this.countryOrigin,
    required this.inteligence,
    required this.adaptability,
    required this.lifeSpan,
    this.imgPath,
  });
  final String id;
  final String name;
  final String countryOrigin;
  final int? inteligence;
  final int? adaptability;
  final String lifeSpan;
  final String? imgPath;

  factory CatModel.fromJson(Map<String, dynamic> json) {
    return CatModel(
      id: json['id'] as String,
      name: json['name'] as String,
      countryOrigin: json['origin'] as String,
      inteligence: json['intelligence'] as int,
      adaptability: json['adaptability'] as int,
      lifeSpan: json['life_span'] as String,
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
        imgPath,
      ];
}
