import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/config/constans.dart';

abstract class BaseSubCategoryDataSource {
  Future<Response> getSubCategoryList(String categoryID);
  Future<Response> getSubCategoryListV2();
}
class RemoteSubCategoryDataSource implements BaseSubCategoryDataSource {

  final Dio _dio;

  RemoteSubCategoryDataSource(this._dio);

  @override
  Future<Response> getSubCategoryList(String categoryID) async{
    return await _dio.get(
      "${Constants.categoryDomain}/$categoryID/subcategories",
    );
  }

  @override
  Future<Response> getSubCategoryListV2() async{
    return await _dio.get(
      Constants.subCategoryDomain,
    );
  }

}