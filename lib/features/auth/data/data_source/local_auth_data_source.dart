import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/auth/data/data_source/base_auth_data_source.dart';
import 'package:ecommerce_app/features/auth/domain/entities/sign_up_request.dart';

class LocalAuthDataSource extends BaseAuthDataSource{
  @override
  Future<Response> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Response> signUp(SignUpRequest data) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

}