// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/data_sources/local/key_value_data_source.dart' as _i377;
import '../core/data_sources/local/secure_storage_data_source.dart' as _i305;
import '../core/network/interceptors/pretty_logger.dart' as _i727;
import '../core/network/interceptors/token_interceptor.dart' as _i500;
import '../core/network/network_module.dart' as _i419;
import '../core/theme/theme_cubit.dart' as _i596;
import '../features/auth/data/remote/auth_service.dart' as _i474;
import '../features/auth/data/repositories/auth_repository_impl.dart' as _i570;
import '../features/auth/domain/repositories/auth_repository.dart' as _i869;
import '../features/auth/domain/usecases/login_usecase.dart' as _i406;
import '../features/auth/presentation/cubit/auth_cubit.dart' as _i70;
import '../features/home/data/remote/home_service.dart' as _i14;
import '../features/home/data/repositories/home_repository_impl.dart' as _i6;
import '../features/home/domain/repositories/home_repository.dart' as _i66;
import '../features/home/domain/usecases/add_fav_usecase.dart' as _i376;
import '../features/home/domain/usecases/get_coins_usecase.dart' as _i918;
import '../features/home/domain/usecases/get_favs_usecase.dart' as _i457;
import '../features/home/domain/usecases/remove_fav_usecase.dart' as _i524;
import '../features/home/presentation/cubit/home_cubit.dart' as _i1017;
import '../features/profile/data/remote/profile_service.dart' as _i581;
import '../features/profile/data/repositories/profile_repository_impl.dart'
    as _i13;
import '../features/profile/domain/repositories/profile_repository.dart'
    as _i386;
import '../features/profile/domain/usecases/get_user_usecase.dart' as _i773;
import '../features/profile/domain/usecases/update_user_usecase.dart' as _i982;
import '../features/profile/presentation/cubit/profile_cubit.dart' as _i300;
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
  gh.singleton<_i596.ThemeCubit>(() => _i596.ThemeCubit());
  gh.singleton<_i361.Dio>(
    () => networkModule.authDio,
    instanceName: 'authDio',
  );
  gh.singleton<_i361.Dio>(
    () => networkModule.otherDio,
    instanceName: 'coinsDio',
  );
  gh.lazySingleton<_i14.HomeService>(
      () => _i14.HomeService(gh<_i361.Dio>(instanceName: 'coinsDio')));
  gh.lazySingleton<_i66.HomeRepository>(
      () => _i6.HomeRepositoryImpl(gh<_i14.HomeService>()));
  gh.lazySingleton<_i377.KeyValueLocalDataSource>(
      () => _i305.SecureStorageDataSource(gh<_i558.FlutterSecureStorage>()));
  gh.lazySingleton<_i474.AuthService>(
      () => _i474.AuthService(gh<_i361.Dio>(instanceName: 'authDio')));
  gh.lazySingleton<_i581.ProfileService>(
      () => _i581.ProfileService(gh<_i361.Dio>(instanceName: 'authDio')));
  gh.lazySingleton<_i386.ProfileRepository>(() => _i13.ProfileRepositoryImpl(
        gh<_i581.ProfileService>(),
        gh<_i377.KeyValueLocalDataSource>(),
      ));
  gh.lazySingleton<_i376.AddFavUseCase>(
      () => _i376.AddFavUseCase(gh<_i66.HomeRepository>()));
  gh.lazySingleton<_i918.GetCoinsUseCase>(
      () => _i918.GetCoinsUseCase(gh<_i66.HomeRepository>()));
  gh.lazySingleton<_i457.GetFavsUseCase>(
      () => _i457.GetFavsUseCase(gh<_i66.HomeRepository>()));
  gh.lazySingleton<_i524.RemoveFavUseCase>(
      () => _i524.RemoveFavUseCase(gh<_i66.HomeRepository>()));
  gh.lazySingleton<_i773.GetUserUseCase>(
      () => _i773.GetUserUseCase(gh<_i386.ProfileRepository>()));
  gh.lazySingleton<_i982.UpdateUserUseCase>(
      () => _i982.UpdateUserUseCase(gh<_i386.ProfileRepository>()));
  gh.lazySingleton<_i103.SplashRepository>(
      () => _i1010.SplashRepositoryImpl(gh<_i377.KeyValueLocalDataSource>()));
  gh.lazySingleton<_i869.AuthRepository>(() => _i570.AuthRepositoryImpl(
        gh<_i474.AuthService>(),
        gh<_i377.KeyValueLocalDataSource>(),
      ));
  gh.factory<_i1017.HomeCubit>(() => _i1017.HomeCubit(
        gh<_i918.GetCoinsUseCase>(),
        gh<_i376.AddFavUseCase>(),
        gh<_i524.RemoveFavUseCase>(),
        gh<_i457.GetFavsUseCase>(),
      ));
  gh.factory<_i300.ProfileCubit>(() => _i300.ProfileCubit(
        gh<_i773.GetUserUseCase>(),
        gh<_i982.UpdateUserUseCase>(),
      ));
  gh.lazySingleton<_i482.GetTokenUseCase>(
      () => _i482.GetTokenUseCase(gh<_i103.SplashRepository>()));
  gh.lazySingleton<_i406.LoginUseCase>(
      () => _i406.LoginUseCase(gh<_i869.AuthRepository>()));
  gh.factory<_i371.SplashCubit>(
      () => _i371.SplashCubit(gh<_i482.GetTokenUseCase>()));
  gh.factory<_i70.AuthCubit>(() => _i70.AuthCubit(gh<_i406.LoginUseCase>()));
  return getIt;
}

class _$NetworkModule extends _i419.NetworkModule {}
