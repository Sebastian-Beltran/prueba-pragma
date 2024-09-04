import 'package:equatable/equatable.dart';
import 'package:prueba_pragma/core/state/custom_state.dart';
import 'package:prueba_pragma/features/home/models/cat_model.dart';
import 'package:prueba_pragma/features/home/models/img_model.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.cats,
    required this.catImage,
  });
  final CustomState<List<CatModel>> cats;
  final CustomState<ImgModel> catImage;

  factory HomeState.initial() => const HomeState(
        cats: CustomState.initial(),
        catImage: CustomState.initial(),
      );

  @override
  List<Object?> get props => [cats];

  HomeState copyWith({
    CustomState<List<CatModel>>? cats,
    CustomState<ImgModel>? catImage,
  }) {
    return HomeState(
      cats: cats ?? this.cats,
      catImage: catImage ?? this.catImage,
    );
  }
}
