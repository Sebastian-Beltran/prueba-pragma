import 'package:either_dart/either.dart';
import 'package:prueba_pragma/features/home/models/cat_model.dart';
import 'package:prueba_pragma/features/home/models/img_model.dart';

abstract class HomeService {
  Future<Either<String, List<CatModel>>> getCatList();
  Future<Either<String, ImgModel>> getImage(String catId);
}
