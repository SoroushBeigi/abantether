import 'package:abantether/features/profile/domain/entities/user_entity.dart';
import 'package:abantether/features/profile/domain/usecases/get_user_usecase.dart';
import 'package:abantether/features/profile/domain/usecases/update_user_usecase.dart';
import 'package:abantether/features/profile/domain/validators/profile_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/update_user_entity.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetUserUseCase _getUserUseCase;
  final UpdateUserUseCase _updateUserUseCase;
  ProfileCubit(this._getUserUseCase, this._updateUserUseCase) : super(const ProfileState.initial()) {
    Future.microtask(() => getUserInfo());
  }

  Future<void> getUserInfo() async {
    emit(const ProfileState.loading());
    final result = await _getUserUseCase();
    result.fold(
      onSuccess: (data) {
        emit(ProfileState.success(user: data));
      },
      onError: (failure) => emit(ProfileState.error(error: failure.message)),
    );
  }

  Future<void> updateUser({required int id, required String phoneNumber}) async {

    final String? validationError =ProfileValidator.validatePhoneNumber(phoneNumber);
    final currentState = state;

    if(validationError!=null){
      emit(ProfileState.error(error: validationError));
      emit(currentState);
      return;
    }

    emit(const ProfileState.loading());
    final result = await _updateUserUseCase(UpdateUser(id: id,phoneNumber: phoneNumber));
    result.fold(
      onSuccess: (data) {
        final newUser = data.copyWith(phoneNumber: phoneNumber);
        emit(ProfileState.success(user: newUser));
      },
      onError: (failure) => emit(ProfileState.error(error: failure.message)),
    );
  }
}
