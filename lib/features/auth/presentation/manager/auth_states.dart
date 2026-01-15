abstract class AuthStates {}
class InitialAuthState extends AuthStates {}
class SuccessSignInState extends AuthStates {}
class ErrorSignInState extends AuthStates {}