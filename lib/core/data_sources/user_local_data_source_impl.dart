import 'package:abantether/core/constants/app_constants.dart';
import 'package:abantether/core/data_sources/user_local_data_source.dart';
import 'package:abantether/features/auth/domain/entities/auth.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserLocalDataSource)
class UserLocalDataSourceImpl extends UserLocalDataSource {
  // final storage = const FlutterSecureStorage();
  UserLocalDataSourceImpl();

  @override
  Future<Auth> readToken() async{
    // final token = await storage.read(key: tokenLocalKey);
    return Auth(authToken: 'token');
  }

  @override
  Future<void> writeToken(Auth auth)async {
    // await storage.write(key: tokenLocalKey, value: auth.authToken);
  }

}