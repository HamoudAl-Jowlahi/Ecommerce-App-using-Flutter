class SignUpRequest {
  final String name;
  final String phone;
  final String password;
  final String email;

  SignUpRequest({
      required this.name, required this.phone, required this.password,required this.email
  });
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
      "password": password,
      "rePassword": password,
      "email": email,
    };
  }
}