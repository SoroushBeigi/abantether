part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _HomeInitial;
  const factory HomeState.loading() = _HomeLoading;
  const factory HomeState.success({required List<Coin> coins}) = _HomeSuccess;
  const factory HomeState.error({String? error}) = _HomeError;
}
