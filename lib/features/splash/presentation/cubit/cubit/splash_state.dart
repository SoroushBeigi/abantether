part of 'splash_cubit.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;
  const factory SplashState.navigateToHome() = _NavigateHome;
  const factory SplashState.navigateToAuth() = _NavigateAuth;
  const factory SplashState.error({String? error}) = _NavigateErr;
}
