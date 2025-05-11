import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/category/models/category.dart';
import 'package:e_commerce_app/data/category/source/category_firebase_service.dart';
import 'package:e_commerce_app/domain/category/entity/category.dart';
import 'package:e_commerce_app/domain/category/repository/category.dart';
import 'package:e_commerce_app/service_locator.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<Either> getCategories() async {
    var categories = await sl<CategoryFirebaseService>().getCategories();
    return categories.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data).map((e) {
            if (e is Map<String, dynamic>) {
              return CategoryModel.fromMap(e).toEntity();
            } else if (e is CategoryEntity) {
              return e;
            } else {
              throw Exception("Unexpected data type: ${e.runtimeType}");
            }
          }).toList(),
        );
      },
    );
  }
}
