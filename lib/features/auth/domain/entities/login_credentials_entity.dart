class LoginCredentials {
  String email;
  String password;
  
  LoginCredentials({
    required this.email,
    required this.password,
  });
}

extension AuthEntityMapper on LoginCredentials {
  Map<String,dynamic> toJson() => {'email':email,'password':password};
}
