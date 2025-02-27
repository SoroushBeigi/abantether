import 'package:abantether/features/auth/domain/entities/auth.dart';

abstract class UserLocalDataSource {
  Future<void> writeToken(Auth auth);
  Future<Auth> readToken();
}
