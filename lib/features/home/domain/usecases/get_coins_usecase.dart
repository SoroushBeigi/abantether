import 'package:abantether/core/result.dart';
import 'package:abantether/core/use_case.dart';
import 'package:abantether/features/home/domain/entities/coin.dart';
import 'package:abantether/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCoinsUseCase extends BaseUseCaseNoArgs<Result<List<Coin>>> {
  GetCoinsUseCase(this._homeRepository);

  final HomeRepository _homeRepository;

  @override
  Future<Result<List<Coin>>> call() async {
    final result = await _homeRepository.getCoins();
    return result;
  }
}
