import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/config/constans.dart';
import 'package:ecommerce_app/features/auth/domain/entities/sign_up_request.dart';
import 'base_auth_data_source.dart';

class RemoteAuthDataSource extends BaseAuthDataSource {
  final Dio _dio;
  RemoteAuthDataSource(this._dio);
  @override
  Future<Response> signIn(String email, String password) async{
    return await _dio.post(//why get
      Constants.signInDomain,
      data: {
        'email' : email,
        'password' : password,
      }
    );
  }

  @override
  Future<Response> signUp(SignUpRequest data) async{
    return await _dio.post(
        Constants.signUpDomain,
        data: data.toJson(),
    );
  }


}