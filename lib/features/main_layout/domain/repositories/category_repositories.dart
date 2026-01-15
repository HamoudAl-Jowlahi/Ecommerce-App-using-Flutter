import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failure.dart';
import 'package:ecommerce_app/features/main_layout/domain/entities/category_data.dart';

abstract class CategoryRepositories {
  Future<Either<Failure, List<CategoryData>>> getCategoryDataList();
}