import 'package:abantether/core/result.dart';
import 'package:abantether/features/auth/domain/entities/auth.dart';

abstract class SplashRepository {
  Future<Result<Auth>> getToken();
}
