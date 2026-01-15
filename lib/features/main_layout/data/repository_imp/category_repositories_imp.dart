import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/failures/failure.dart';
import 'package:ecommerce_app/core/failures/server_failure.dart';
import 'package:ecommerce_app/features/main_layout/data/data_source/category_data_source.dart';
import 'package:ecommerce_app/features/main_layout/data/model/category_model.dart';
import 'package:ecommerce_app/features/main_layout/domain/entities/category_data.dart';
import 'package:ecommerce_app/features/main_layout/domain/repositories/category_repositories.dart';
 class CategoryRepositoriesImp implements CategoryRepositories{

   final BaseCategoryDataSource _baseCategoryDataSource;
   CategoryRepositoriesImp(this._baseCategoryDataSource);

   @override
  Future<Either<Failure, List<CategoryData>>> getCategoryDataList() async{
    try{
      final response = await _baseCategoryDataSource.getCategoryList();
      List<CategoryData> categoryDataList = [];
      if(response.statusCode == 200){
        var dataResponse = response.data["data"];
        //cuz return object-> do mapping
        for(var element in dataResponse){
           categoryDataList.add(CategoryModel.fromJson(element));
        }
        return Right(categoryDataList);
      } else {
        return Left(
          ServerFailure(
              statusCode: response.statusCode.toString(),
              message: response.data["message"],
          )
        );
      }
    }on DioException catch(dioException){
      return Left(
          ServerFailure(
            statusCode: dioException.response?.statusCode.toString() ?? "",
            message: dioException.error.toString(),
          )
      );
    }
  }

}