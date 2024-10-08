import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_pragma/core/state/custom_state.dart';
import 'package:prueba_pragma/features/home/provider/home_state.dart';
import 'package:prueba_pragma/features/home/services/home_service.dart';
import 'package:prueba_pragma/features/home/services/home_service_impl.dart';

final homeProvider = StateNotifierProvider.autoDispose<HomeNotifier, HomeState>(
    HomeNotifier.fromRef);

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier({
    required this.homeService,
    required this.ref,
  }) : super(HomeState.initial());

  factory HomeNotifier.fromRef(Ref ref) {
    return HomeNotifier(
      homeService: ref.read(homeServiceProvider),
      ref: ref,
    );
  }
  final HomeService homeService;
  final Ref ref;

  void resetState() => state = HomeState.initial();

  Future<void> getCatList() async {
    final res = await homeService.getCatList();
    res.fold(
      (left) => Text(left),
      (right) => state = state.copyWith(
        cats: CustomState.data(right),
      ),
    );
  }

  Future<void> getImageCat(String catId) async {
    final existingImageState = state.catImages[catId];
    if (existingImageState != null) {
      return;
    }
    state = state.copyWith(
      catImages: {
        ...state.catImages,
        catId: const CustomState.loading(),
      },
    );

    final res = await homeService.getImage(catId);

    res.fold(
      (left) => state = state.copyWith(
        catImages: {
          ...state.catImages,
          catId: CustomState.failure(left),
        },
      ),
      (right) => state = state.copyWith(
        catImages: {
          ...state.catImages,
          catId: CustomState.data(right),
        },
      ),
    );
  }
}
