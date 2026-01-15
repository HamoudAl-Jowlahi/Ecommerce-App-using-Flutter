import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/failures/failure.dart';

class SignInUseCase {
  // single responsibility
  final AuthRepository _authRepository;
  SignInUseCase(this._authRepository);
  //or call
  Future<Either<Failure, bool>> execute(String email,String password) async {
    return await _authRepository.signIn(email, password);

  }
}