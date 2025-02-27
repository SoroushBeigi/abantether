import 'package:abantether/core/constants/app_constants.dart';
import 'package:abantether/core/data_sources/user_local_data_source.dart';
import 'package:abantether/features/auth/domain/entities/auth.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Alternative secure way by using flutter_secure_storage is commented in this file
@LazySingleton(as: UserLocalDataSource)
class UserLocalDataSourceImpl extends UserLocalDataSource {
  SharedPreferences? prefs;
  //final storage = const FlutterSecureStorage();
  UserLocalDataSourceImpl();

  @override
  Future<Auth> readToken() async {
    // final token = await storage.read(key: tokenLocalKey);
    // return Auth(authToken: token);
    if (prefs == null) {
      await init();
    }
    final token = prefs!.getString(tokenLocalKey);
    return Auth(authToken: token);
  }

  @override
  Future<void> writeToken(Auth auth) async {
    // await storage.write(key: tokenLocalKey, value: auth.authToken);
    if (prefs == null) {
      await init();
    }
    await prefs!.setString(tokenLocalKey, auth.authToken ?? '');
  }

  @override
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }
}
