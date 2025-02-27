import 'package:abantether/features/splash/domain/usecases/get_token_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._getTokenUsecase) : super(const SplashState.initial()) {
    Future.microtask(() => navigate());
  }

  final GetTokenUsecase _getTokenUsecase;

  Future<void> navigate() async {
    await Future.delayed(const Duration(seconds: 2));
    final auth = await _getTokenUsecase();
    auth.fold(
      onSuccess: (data) {
        if (data.authToken?.isNotEmpty ?? false) {
          emit(const SplashState.navigateToHome());
        } else {
          emit(const SplashState.navigateToAuth());
        }
      },
      onError: (failure) => emit(SplashState.error(error: failure.message)),
    );
  }
}