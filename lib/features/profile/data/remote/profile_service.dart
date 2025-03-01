import 'package:abantether/features/profile/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_service.g.dart';

@RestApi()
@lazySingleton
abstract class ProfileService {
  @factoryMethod
  factory ProfileService(@Named('authDio') Dio dio) = _ProfileService;

  @GET('/auth/me')
  Future<HttpResponse<UserModel>> getUserInfo();

  @PUT('/user/{id}')
  Future<HttpResponse<UserModel>> updateUser(@Path('id') String id, @Body() Map<String, dynamic> body);
}
