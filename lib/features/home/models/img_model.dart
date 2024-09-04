import 'package:equatable/equatable.dart';

class ImgModel extends Equatable {
  const ImgModel({
    required this.url,
  });
  final String url;

  factory ImgModel.fromJson(Map<String, dynamic> json) {
    return ImgModel(
      url: json['url'] as String,
    );
  }

  @override
  List<Object?> get props => [
        url,
      ];
}
