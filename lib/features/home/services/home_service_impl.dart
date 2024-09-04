import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_pragma/core/api/request_handler.dart';
import 'package:prueba_pragma/features/home/models/cat_model.dart';
import 'package:prueba_pragma/features/home/models/img_model.dart';
import 'dart:convert' as convert;

import 'package:prueba_pragma/features/home/services/home_service.dart';

final homeServiceProvider = Provider<HomeService>(HomeServiceImpl.fromRef);

class HomeServiceImpl implements HomeService {
  HomeServiceImpl({
    required this.client,
  });

  factory HomeServiceImpl.fromRef(Ref ref) {
    return HomeServiceImpl(
      client: ref.read(requestHandlerProvider),
    );
  }

  final RequestHandler client;

  @override
  Future<Either<String, List<CatModel>>> getCatList() async {
    try {
      const path = '/breeds';
      final res = await client.performGet(path);
      List<dynamic> body = jsonDecode(res.body);
      return Right(
        body.map((dynamic item) => CatModel.fromJson(item)).toList(),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, ImgModel>> getImage(String catId) async {
    try {
      final path = '/images/search?breed_ids=$catId';
      final res = await client.performGet(path);
      final data = convert.jsonDecode(res.body.trim()) as Map<String, dynamic>;
      return Right(ImgModel.fromJson(data));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
