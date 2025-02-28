part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _ProfileInitial;
  const factory ProfileState.loading() = _ProfileLoading;
  const factory ProfileState.success({required User user}) = _ProfileSuccess;
  const factory ProfileState.error({String? error}) = _ProfileError;
}
