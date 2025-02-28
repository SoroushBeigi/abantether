import 'package:abantether/features/home/data/models/add_fav_dto.dart';

class AddFav {
  final int? cryptoId;

  AddFav({this.cryptoId});
}

extension RemoveFavMapper on AddFav{
  AddFavDto toDto()=> AddFavDto(cryptoId:cryptoId);
}
