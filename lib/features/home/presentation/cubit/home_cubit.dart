import 'package:abantether/core/result.dart';
import 'package:abantether/features/home/domain/entities/add_fav_data.dart';
import 'package:abantether/features/home/domain/entities/coin.dart';
import 'package:abantether/features/home/domain/entities/fav.dart';
import 'package:abantether/features/home/domain/entities/remove_fav_data.dart';
import 'package:abantether/features/home/domain/usecases/add_fav_usecase.dart';
import 'package:abantether/features/home/domain/usecases/get_coins_usecase.dart';
import 'package:abantether/features/home/domain/usecases/get_favs_usecase.dart';
import 'package:abantether/features/home/domain/usecases/remove_fav_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetCoinsUseCase _getCoinsUseCase;
  final AddFavUseCase _addFavUseCase;
  final RemoveFavUseCase _removeFavUseCase;
  final GetFavsUseCase _getFavsUseCase;

  List<Fav> favList = [];

  HomeCubit(
    this._getCoinsUseCase,
    this._addFavUseCase,
    this._removeFavUseCase,
    this._getFavsUseCase,
  ) : super(const HomeState.initial()) {
    Future.microtask(() => loadCoinsAndFavs());
  }

  Future<void> toggleLike({required int coinId, required bool isLiked}) async {
    final currentState = state;

    if (currentState is! _HomeSuccess) return;
    final coins = (state as _HomeSuccess).coins;

    emit(currentState.copyWith(loadingCoinId: coinId));

    if (isLiked) {
      final favId = favList.firstWhere((element) => element.cryptoId == coinId).id;
      final removeFavResult = await _removeFavUseCase(RemoveFav(favId: favId));
      removeFavResult.fold(
        onSuccess: (data) {
          final updatedCoins = coins.map((e) => e.id == coinId ? e.copyWith(isFavorite: false) : e).toList();
          emit(currentState.copyWith(loadingCoinId: null, coins: updatedCoins));
        },
        onError: (failure) => emit(HomeState.error(error: failure.message)),
      );
    } else {
      final addFavResult = await _addFavUseCase(AddFav(cryptoId: coinId));
      addFavResult.fold(
        onSuccess: (data) {
          final updatedCoins = coins.map((e) => e.id == coinId ? e.copyWith(isFavorite: true) : e).toList();
          emit(currentState.copyWith(loadingCoinId: null, coins: updatedCoins));
        },
        onError: (failure) => emit(HomeState.error(error: failure.message)),
      );
    }
  }

  Future<void> loadCoinsAndFavs() async {
    emit(const HomeState.loading());
    final results = await Future.wait([
      _getCoinsUseCase(),
      _getFavsUseCase(),
    ]);
    final coinsResult = results[0] as Result<List<Coin>>;
    final favsResult = results[1] as Result<List<Fav>>;
    coinsResult.fold(
      onSuccess: (coinsData) {
        favsResult.fold(
          onSuccess: (favsData) {
            favList = favsData;
            final favCryptoIds = favsData.map((fav) => fav.cryptoId).toList();
            final coins = coinsData.map((coin) {
              if (favCryptoIds.contains(coin.id)) {
                return coin.copyWith(isFavorite: true);
              }
              return coin;
            }).toList();
            emit(HomeState.success(coins: coins));
          },
          onError: (failure) => emit(HomeState.error(error: failure.message)),
        );
      },
      onError: (failure) => emit(HomeState.error(error: failure.message)),
    );
  }
}
