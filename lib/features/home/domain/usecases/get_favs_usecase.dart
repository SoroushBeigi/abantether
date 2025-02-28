import 'package:abantether/core/result.dart';
import 'package:abantether/core/use_case.dart';
import 'package:abantether/features/home/domain/entities/fav.dart';
import 'package:abantether/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetFavsUsecase extends BaseUseCaseNoArgs<Result<List<Fav>>> {
  GetFavsUsecase(this._homeRepository);
  
  final HomeRepository _homeRepository;

  @override
  Future<Result<List<Fav>>> call() async {
    final result = await _homeRepository.getFavs();
    return result;
  }
}
