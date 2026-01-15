import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/auth/domain/entities/sign_up_request.dart';

abstract class BaseAuthDataSource {

  Future<Response>signIn(String email, String password);
  Future<Response>signUp(SignUpRequest data);
}
