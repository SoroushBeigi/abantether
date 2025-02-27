// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/data_sources/user_local_data_source.dart' as _i539;
import '../core/data_sources/user_local_data_source_impl.dart' as _i997;
import '../core/network/interceptors/pretty_logger.dart' as _i727;
import '../core/network/interceptors/token_interceptor.dart' as _i500;
import '../core/network/network_module.dart' as _i419;
import '../features/auth/data/remote/auth_service.dart' as _i474;
import '../features/auth/data/repositories/auth_repository_impl.dart' as _i570;
import '../features/auth/domain/repositories/auth_repository.dart' as _i869;
import '../features/auth/domain/usecases/login_usecase.dart' as _i406;
import '../features/auth/presentation/cubit/auth_cubit.dart' as _i70;
import '../features/splash/data/repositories/splash_repository_impl.dart'
    as _i1010;
import '../features/splash/domain/repositories/splash_repository.dart' as _i103;
import '../features/splash/domain/usecases/get_token_usecase.dart' as _i482;
import '../features/splash/presentation/cubit/cubit/splash_cubit.dart' as _i371;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  gh.singleton<_i500.DioTokenInterceptor>(
      () => networkModule.dioTokenInterceptor);
  gh.singleton<_i727.PrettyDioLogger>(() => networkModule.prettyDioLogger);
  gh.singleton<_i361.Dio>(
    () => networkModule.authDio,
    instanceName: 'authDio',
  );
  gh.singleton<_i361.Dio>(
    () => networkModule.otherDio,
    instanceName: 'coinsDio',
  );
  gh.lazySingleton<_i539.UserLocalDataSource>(
      () => _i997.UserLocalDataSourceImpl());
  gh.lazySingleton<_i103.SplashRepository>(
      () => _i1010.SplashRepositoryImpl(gh<_i539.UserLocalDataSource>()));
  gh.lazySingleton<_i474.AuthService>(
      () => _i474.AuthService(gh<_i361.Dio>(instanceName: 'authDio')));
  gh.lazySingleton<_i482.GetTokenUsecase>(
      () => _i482.GetTokenUsecase(gh<_i103.SplashRepository>()));
  gh.lazySingleton<_i869.AuthRepository>(() => _i570.AuthRepositoryImpl(
        gh<_i474.AuthService>(),
        gh<_i539.UserLocalDataSource>(),
      ));
  gh.factory<_i371.SplashCubit>(
      () => _i371.SplashCubit(gh<_i482.GetTokenUsecase>()));
  gh.lazySingleton<_i406.LoginUseCase>(
      () => _i406.LoginUseCase(gh<_i869.AuthRepository>()));
  gh.factory<_i70.AuthCubit>(() => _i70.AuthCubit(gh<_i406.LoginUseCase>()));
  return getIt;
}

class _$NetworkModule extends _i419.NetworkModule {}
