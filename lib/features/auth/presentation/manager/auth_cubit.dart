import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/services/web_service.dart';
import 'package:ecommerce_app/features/auth/domain/entities/sign_up_request.dart';
import 'package:ecommerce_app/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '/features/auth/data/data_source/base_auth_data_source.dart';
import '/features/auth/data/data_source/remote_auth_data_source.dart';
import '/features/auth/data/repository_imp/auth_repository_imp.dart';
import '/features/auth/domain/repositories/auth_repository.dart';
import '/features/auth/domain/use_cases/sign_in_use_case.dart';
import '/features/auth/presentation/manager/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(): super(InitialAuthState());
  static AuthCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailSignUpController = TextEditingController();
  TextEditingController passwordSignUpController = TextEditingController();

  final WebServices _services =WebServices();
  late BaseAuthDataSource _authDataSource;
  late SignInUseCase _signInUseCase;
  late SignUpUseCase _signUpUseCase;
  late AuthRepository _authRepository;

  Future<bool> signIn() async {
    //web service || Network Handler
    // Enhancement (service locator)

    //D Injection && D inversion----------- we use these
    // _authDataSource = RemoteAuthDataSource(Dio());
    _authDataSource = RemoteAuthDataSource(_services.freeDio);
    _authRepository = AuthRepositoryImp(_authDataSource);
    _signInUseCase = SignInUseCase(_authRepository);

    EasyLoading.show();
    final result = await _signInUseCase.execute(emailController.text, passwordController.text);

    return result.fold(
          (fail) {EasyLoading.dismiss(); emit(ErrorSignInState());     return Future.value(false);},
          (data) {EasyLoading.dismiss(); emit(SuccessSignInState());   return Future.value(true);},
    );

  }
  Future<bool> signUp() async {
    // _authDataSource = RemoteAuthDataSource(Dio());
    _authDataSource = RemoteAuthDataSource(_services.freeDio);
    _authRepository = AuthRepositoryImp(_authDataSource);
    _signUpUseCase = SignUpUseCase(_authRepository);

    var data = SignUpRequest(name: fullNameController.text, phone: phoneController.text, password: passwordSignUpController.text,email: emailSignUpController.text);

    EasyLoading.show();
    final result = await _signUpUseCase.execute(data);

    return result.fold(
          (fail) {EasyLoading.dismiss(); emit(ErrorSignInState());     return Future.value(false);},
          (data) {EasyLoading.dismiss(); emit(SuccessSignInState());   return Future.value(true);},
    );

  }
}