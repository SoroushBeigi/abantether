import 'package:abantether/features/home/data/models/coin_model.dart';
import 'package:abantether/features/home/data/models/fav_model.dart';
import 'package:abantether/features/home/domain/entities/coin.dart';
import 'package:abantether/features/home/domain/entities/fav.dart';

extension CoinModelMapper on CoinModel {
  Coin toEntity() => Coin(
        id: id,
        iconAddress: iconAddress,
        isFavorite: isFavorite,
        name: name,
        price: price,
        symbol: symbol,
      );
}

extension FavModelMapper on FavModel {
  Fav toEntity() => Fav(
        id: id,
        cryptoId: cryptoId,
        userId: userId,
      );
}
