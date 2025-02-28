class AuthModel {
  final String? authToken;
  const AuthModel({this.authToken});

   factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
     authToken: json['authToken']
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'authToken': authToken,
    } as Map<String, dynamic>;
  }

}