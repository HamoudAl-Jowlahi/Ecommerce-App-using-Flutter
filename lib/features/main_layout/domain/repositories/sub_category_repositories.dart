import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failure.dart';
import 'package:ecommerce_app/features/main_layout/domain/entities/sub_category_data.dart';

abstract class SubCategoryRepositories {
  //String categoryID)..> make it optinal
  Future<Either<Failure, List<SubCategoryData>>> getSubCategoryDataList(
      {String categoryID});
}