import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/config/constans.dart';

abstract class BaseCategoryDataSource {
  Future<Response> getCategoryList();
}
// diffrent about extend and implement is that
class RemoteCategoryDataSource implements BaseCategoryDataSource {

  final Dio _dio;

  RemoteCategoryDataSource(this._dio);

  @override
  Future<Response> getCategoryList() async{
    return await _dio.get(//dont use await here why????????????????
      Constants.categoryDomain,
    );
  }

}