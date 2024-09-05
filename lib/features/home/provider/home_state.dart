import 'package:prueba_pragma/core/state/custom_state.dart';
import 'package:prueba_pragma/features/home/models/cat_model.dart';
import 'package:prueba_pragma/features/home/models/img_model.dart';

class HomeState {
  final CustomState<List<CatModel>> cats;
  final Map<String, CustomState<ImgModel>> catImages;

  const HomeState({
    required this.cats,
    required this.catImages,
  });

  factory HomeState.initial() {
    return const HomeState(
      cats: CustomState.initial(),
      catImages: {},
    );
  }

  HomeState copyWith({
    CustomState<List<CatModel>>? cats,
    Map<String, CustomState<ImgModel>>? catImages,
  }) {
    return HomeState(
      cats: cats ?? this.cats,
      catImages: catImages ?? this.catImages,
    );
  }
}
