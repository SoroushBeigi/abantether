import 'package:abantether/core/result.dart';
import 'package:abantether/features/home/domain/entities/fav.dart';
import 'package:abantether/features/profile/data/mappers/profile_mappers.dart';
import 'package:abantether/features/profile/data/remote/profile_service.dart';
import 'package:abantether/features/profile/domain/entities/update_user_entity.dart';
import 'package:abantether/features/profile/domain/entities/user_entity.dart';
import 'package:abantether/features/profile/domain/repositories/profile_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileService _service;

  ProfileRepositoryImpl(this._service);

  @override
  Future<Result<User>> getUserInfo() async {
    try {
      final result = await _service.getUserInfo();
      final user = result.data;
      return Success(user.toEntity());
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response!.statusCode;
        final data = e.response!.data;
        if (data is Map<String, dynamic> && (data['message'] != null)) {
          return Error(CustomFailure(data['message']));
        }
        if (statusCode! >= 500) {
          return const Error(ServerFailure());
        }
        if (statusCode >= 400) {
          return const Error(ClientFailure());
        }
      }
      return const Error(NetworkFailure());
    } catch (e) {
      return const Error(UnknownFailure());
    }
  }

  @override
  Future<Result<User>> updateUserInfo({required UpdateUser updateUser}) async {
    try {
      final result = await _service.updateUser(updateUser.id.toString(), updateUser.toDto().toJson());
      final user = result.data;
      return Success(user.toEntity());
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response!.statusCode;
        final data = e.response!.data;
        if (data is Map<String, dynamic> && (data['message'] != null)) {
          return Error(CustomFailure(data['message']));
        }
        if (statusCode! >= 500) {
          return const Error(ServerFailure());
        }
        if (statusCode >= 400) {
          return const Error(ClientFailure());
        }
      }
      return const Error(NetworkFailure());
    } catch (e) {
      return const Error(UnknownFailure());
    }
  }
}
