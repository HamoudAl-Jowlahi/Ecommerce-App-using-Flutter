import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failure.dart';
import 'package:ecommerce_app/features/auth/domain/entities/sign_up_request.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> signIn (String email, String password);
  Future<Either<Failure, bool>> signUp (SignUpRequest data);
}