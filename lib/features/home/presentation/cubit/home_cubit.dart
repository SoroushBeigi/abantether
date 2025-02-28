import 'package:abantether/features/home/domain/entities/coin.dart';
import 'package:abantether/features/home/domain/usecases/add_fav_usecase.dart';
import 'package:abantether/features/home/domain/usecases/get_coins_usecase.dart';
import 'package:abantether/features/home/domain/usecases/get_favs_usecase.dart';
import 'package:abantether/features/home/domain/usecases/remove_fav_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetCoinsUsecase _getCoinsUsecase;
  final AddFavUsecase _addFavUsecase;
  final RemoveFavUsecase _removeFavUsecase;
  final GetFavsUsecase _getFavsUsecase;

  HomeCubit(
    this._getCoinsUsecase,
    this._addFavUsecase,
    this._removeFavUsecase,
    this._getFavsUsecase,
  ) : super(const HomeState.initial()) {
    Future.microtask(() => loadCoins());
  }

  Future<void> loadCoins() async {
    emit(const HomeState.loading());
    final result = await _getCoinsUsecase();
    result.fold(
      onSuccess: (data) {
        emit(HomeState.success(coins: data));
      },
      onError: (failure) => emit(HomeState.error(error: failure.message)),
    );
  }
}
