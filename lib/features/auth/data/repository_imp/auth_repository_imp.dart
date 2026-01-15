import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/failures/server_failure.dart';
import 'package:ecommerce_app/core/services/web_service.dart';
import 'package:ecommerce_app/features/auth/data/data_source/base_auth_data_source.dart';
import 'package:ecommerce_app/features/auth/domain/entities/sign_up_request.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/failures/failure.dart';

class AuthRepositoryImp implements AuthRepository {
  final BaseAuthDataSource _authDataSource;
  AuthRepositoryImp(this._authDataSource);

  @override
  Future<Either<Failure, bool>> signIn(String email, String password) async{
      try {
        final response = await _authDataSource.signIn(email, password);
        if(response.statusCode == 200) {
          WebServices().setMobileToken(response.data['token']);
           // log(WebServices().myToken.toString() );
          return const Right(true);
        } else {
          return  Left(
            ServerFailure(
                statusCode: response.statusCode.toString(),
              message: response.data["message"],
            )
          );
        }
      } on DioException catch(dioException){
        return  Left(
            ServerFailure(
              statusCode: dioException.response?.statusCode.toString() ?? '',
              message: dioException.message,
            )
        );
      }

  }

  @override
  Future<Either<Failure, bool>> signUp(SignUpRequest data) async{

    try {
      final response = await _authDataSource.signUp(data);
      if(response.statusCode == 201) {
        WebServices().setMobileToken(response.data['token']);
        // log(WebServices().myToken.toString() );
        return const Right(true);
      } else {
        return  Left(
            ServerFailure(
              statusCode: response.statusCode.toString(),
              message: response.data["message"],
            )
        );
      }
    } on DioException catch(dioException){
      return  Left(
          ServerFailure(
            statusCode: dioException.response?.statusCode.toString() ?? '',
            message: dioException.message,
          )
      );
    }
  }


}