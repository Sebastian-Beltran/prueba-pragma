import 'package:equatable/equatable.dart';

class Cat extends Equatable {
  const Cat({
    required this.name,
    required this.countryOrigin,
    required this.inteligence,
    required this.adaptability,
    required this.lifeSpan,
    required this.imgPath,
    required this.urlInfo,
    required this.description,
    required this.dogFrendly,
    required this.affection,
  });
  final String name;
  final String countryOrigin;
  final int inteligence;
  final int adaptability;
  final String lifeSpan;
  final String imgPath;
  final String? urlInfo;
  final String description;
  final int dogFrendly;
  final int affection;

  @override
  List<Object?> get props => [
        name,
        countryOrigin,
        inteligence,
        adaptability,
        lifeSpan,
        imgPath,
        urlInfo,
        description,
        dogFrendly,
        affection,
      ];
}
