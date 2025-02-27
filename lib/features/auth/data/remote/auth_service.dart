import 'package:abantether/features/auth/data/models/auth_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_service.g.dart';

@RestApi()
@lazySingleton
abstract class AuthService {
  @factoryMethod
  factory AuthService(@Named('authDio') Dio dio) = _AuthService;

  @POST('/auth/login')
  Future<HttpResponse<AuthModel>> login(@Body() Map<String, dynamic> body);

}


