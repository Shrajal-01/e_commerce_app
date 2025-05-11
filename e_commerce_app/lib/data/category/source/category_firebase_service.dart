// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dartz/dartz.dart';

// abstract class CategoryFirebaseService {

//   Future<Either> getCategories();
// }

// class CategoryFirebaseServiceImpl extends CategoryFirebaseService {

//   @override
//   Future < Either > getCategories() async {
//     try {
//       var categories = await FirebaseFirestore.instance.collection('Categories').get();
//       return Right(
//         categories.docs.map((e) => e.data()).toList()
//       );
//     } catch (e) {
//       return const Left(
//         'Please try again'
//       );
//     }
//   }

// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/category/models/category.dart';
import 'package:e_commerce_app/domain/category/entity/category.dart';

abstract class CategoryFirebaseService {
  Future<Either> getCategories();
}

class CategoryFirebaseServiceImpl extends CategoryFirebaseService {
  @override
  Future<Either<String, List<CategoryEntity>>> getCategories() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('Categories').get();

      final List<CategoryEntity> categories = [];

      for (final doc in querySnapshot.docs) {
        print('Checking doc: ${doc.id}');

        try {
          final data = doc.data();
          if (data == null) {
            print(' Null data for document ${doc.id}');
            continue;
          }

          print(' Data for ${doc.id}: $data');

          final model = CategoryModel.fromMap(data);
          categories.add(model.toEntity());
        } catch (e) {
          print(' Error processing document ${doc.id}: $e');
        }
      }

      return Right(categories);
    } catch (e) {
      print(' Firestore exception: $e');
      return const Left('Please try again');
    }
  }
}
