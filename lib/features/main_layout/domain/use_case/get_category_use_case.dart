import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/domain/repositories/category_repositories.dart';

import '../../../../core/failures/failure.dart';
import '../entities/category_data.dart';

class GetCategoryUseCase {
  final CategoryRepositories _categoryRepositories;

  GetCategoryUseCase(this._categoryRepositories);

  Future<Either<Failure, List<CategoryData>>> execute() async {
    return await _categoryRepositories.getCategoryDataList();
  }
}