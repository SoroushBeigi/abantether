import 'package:abantether/core/constants/app_constants.dart';
import 'package:abantether/core/result.dart';
import 'package:abantether/features/profile/data/mappers/profile_mappers.dart';
import 'package:abantether/features/profile/data/remote/profile_service.dart';
import 'package:abantether/features/profile/domain/entities/update_user_entity.dart';
import 'package:abantether/features/profile/domain/entities/user_entity.dart';
import 'package:abantether/features/profile/domain/repositories/profile_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data_sources/local/key_value_data_source.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileService _service;
  final KeyValueLocalDataSource _localDataSource;

  ProfileRepositoryImpl(this._service,this._localDataSource);

  @override
  Future<Result<User>> getUserInfo() async {
    try {
      final result = await _service.getUserInfo();
      var user = result.data.toEntity();
      final phoneNumber = await _localDataSource.read<String>(key: phoneLocalKey);
      if(phoneNumber?.isNotEmpty??false){
        user=user.copyWith(phoneNumber: phoneNumber!);
      }
      return Success(user);
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
      await _localDataSource.write(key: phoneLocalKey, value: updateUser.phoneNumber);
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
