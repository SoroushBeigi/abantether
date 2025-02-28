import 'package:abantether/core/result.dart';
import 'package:abantether/features/home/domain/entities/add_fav_data.dart';
import 'package:abantether/features/home/domain/entities/coin.dart';
import 'package:abantether/features/home/domain/entities/fav.dart';
import 'package:abantether/features/home/domain/entities/remove_fav_data.dart';

abstract class HomeRepository {
  Future<Result<List<Coin>>> getCoins();

  Future<Result<List<Fav>>> getFavs();

  Future<Result<Fav>> addFav({required AddFav addFav});

  Future<Result<void>> removeFav({required RemoveFav removeFav});
}
