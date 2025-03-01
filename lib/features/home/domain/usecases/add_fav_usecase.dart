import 'package:abantether/core/result.dart';
import 'package:abantether/core/use_case.dart';
import 'package:abantether/features/home/domain/entities/add_fav_data.dart';
import 'package:abantether/features/home/domain/entities/fav.dart';
import 'package:abantether/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddFavUseCase extends BaseUseCase<Result<Fav>, AddFav> {
  AddFavUseCase(this._homeRepository);

  final HomeRepository _homeRepository;

  @override
  Future<Result<Fav>> call(arg) async {
    final result = await _homeRepository.addFav(addFav: arg);
    return result;
  }
}
