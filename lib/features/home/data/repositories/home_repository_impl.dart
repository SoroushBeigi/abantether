import 'package:abantether/core/result.dart';
import 'package:abantether/features/home/data/mappers/home_mappers.dart';
import 'package:abantether/features/home/data/remote/home_service.dart';
import 'package:abantether/features/home/domain/entities/add_fav_data.dart';
import 'package:abantether/features/home/domain/entities/coin.dart';
import 'package:abantether/features/home/domain/entities/fav.dart';
import 'package:abantether/features/home/domain/entities/remove_fav_data.dart';
import 'package:abantether/features/home/domain/repositories/home_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  final HomeService _service;

  HomeRepositoryImpl(this._service);
  @override
  Future<Result<Fav>> addFav({required AddFav addFav}) async {
    try {
      final result = await _service.addFav(addFav.toDto().toJson());
      final fav = result.data.toEntity();
      return Success(fav);
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
  Future<Result<List<Coin>>> getCoins() async {
    try {
      final result = await _service.getCoins();
      final coins = result.data.map((e) => e.toEntity()).toList();
      return Success(coins);
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
  Future<Result<List<Fav>>> getFavs() async {
    try {
      final result = await _service.getFavs();
      final favs = result.data.map((e) => e.toEntity()).toList();
      return Success(favs);
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
  Future<Result<void>> removeFav({required RemoveFav removeFav}) async {
    try {
      final result = await _service.removeFav(removeFav.toDto().favId?.toString() ?? '');
      return Success(result);
    } on DioException catch (_) {
      return const Success(null);
    } catch (e) {
      return const Error(UnknownFailure());
    }
  }
}
