import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/domain/entities/sign_up_request.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/failures/failure.dart';

class SignUpUseCase {

  final AuthRepository _authRepository;
  SignUpUseCase(this._authRepository);

  Future<Either<Failure, bool>> execute(SignUpRequest data) async{
    return await _authRepository.signUp(data);
  }
}