import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/domain/repositories/category_repositories.dart';
import 'package:ecommerce_app/features/main_layout/domain/repositories/sub_category_repositories.dart';

import '../../../../core/failures/failure.dart';
import '../entities/category_data.dart';
import '../entities/sub_category_data.dart';

class GetSubCategoryUseCase {
  final SubCategoryRepositories _subCategoryRepositories;

  // GetSubCategoryUseCase(this._subCategoryRepositories);
  GetSubCategoryUseCase(this._subCategoryRepositories);
// String categoryID..> make it optinal
  Future<Either<Failure, List<SubCategoryData>>> execute(
      {String? categoryID}) async {
    return await _subCategoryRepositories.getSubCategoryDataList();
  }
}