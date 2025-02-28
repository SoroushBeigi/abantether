import 'package:abantether/core/result.dart';
import 'package:abantether/core/use_case.dart';
import 'package:abantether/features/home/domain/entities/remove_fav_data.dart';
import 'package:abantether/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RemoveFavUsecase extends BaseUseCase<Result<void>, RemoveFav> {
  RemoveFavUsecase(this._homeRepository);

  final HomeRepository _homeRepository;

  @override
  Future<Result<void>> call(arg) async {
    final result = await _homeRepository.removeFav(removeFav: arg);
    return result;
  }
}
