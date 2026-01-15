import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/failures/failure.dart';
import 'package:ecommerce_app/core/failures/server_failure.dart';
import 'package:ecommerce_app/features/main_layout/data/data_source/category_data_source.dart';
import 'package:ecommerce_app/features/main_layout/data/model/category_model.dart';
import 'package:ecommerce_app/features/main_layout/domain/entities/category_data.dart';
import 'package:ecommerce_app/features/main_layout/domain/repositories/category_repositories.dart';

import '../../domain/entities/sub_category_data.dart';
import '../../domain/repositories/sub_category_repositories.dart';
import '../data_source/sub_category_data_source.dart';
import '../model/sub_category_model.dart';
 class SubCategoryRepositoriesImp implements SubCategoryRepositories{

   final BaseSubCategoryDataSource _baseSubCategoryDataSource;
   SubCategoryRepositoriesImp(this._baseSubCategoryDataSource);

   @override
  /*Future<Either<Failure, List<SubCategoryData>>> getSubCategoryDataList(String categoryID) async{
    try{
      // final response = await _baseSubCategoryDataSource.getSubCategoryList(categoryID);
      final response = await _baseSubCategoryDataSource.getSubCategoryListV2();
      List<SubCategoryData> subCategoryDataList = [];
      if(response.statusCode == 200){
        var dataResponse = response.data["data"];
        //cuz return object-> do mapping
        for(var element in dataResponse){
           subCategoryDataList.add(SubCategoryModel.fromJson(element));
        }
        return Right(subCategoryDataList);
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
  } */
  Future<Either<Failure, List<SubCategoryData>>> getSubCategoryDataList({String? categoryID}) async{
    try{
      final response = await _baseSubCategoryDataSource.getSubCategoryListV2();
      List<SubCategoryData> subCategoryDataList = [];
      if(response.statusCode == 200){
        var dataResponse = response.data["data"];
        //cuz return object-> do mapping
        for(var element in dataResponse){
           subCategoryDataList.add(SubCategoryModel.fromJson(element));
        }
        return Right(subCategoryDataList);
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