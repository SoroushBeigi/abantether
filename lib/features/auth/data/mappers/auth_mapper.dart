import 'package:abantether/features/auth/data/models/auth_model.dart';
import 'package:abantether/features/auth/domain/entities/auth.dart';

extension AuthModelMapper on AuthModel {
  Auth toEntity() => Auth(authToken: authToken);
}

extension AuthEntityMapper on Auth {
  AuthModel toModel() => AuthModel(authToken: authToken);
}
