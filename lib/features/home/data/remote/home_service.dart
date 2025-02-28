import 'package:abantether/features/home/data/models/coin_model.dart';
import 'package:abantether/features/home/data/models/fav_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'home_service.g.dart';

@RestApi()
@lazySingleton
abstract class HomeService {
  @factoryMethod
  factory HomeService(@Named('coinsDio') Dio dio) = _HomeService;

  @GET('/cryptocurrency')
  Future<HttpResponse<List<CoinModel>>> getCoins();

  @GET('/favorites')
  Future<HttpResponse<List<FavModel>>> getFavs();

  @POST('/favorites')
  Future<HttpResponse<FavModel>> addFav(@Body() Map<String, dynamic> body);

  @DELETE('/favorites/{id}')
  Future<void> removeFav(@Path('id') String id);

}


