import 'package:abantether/features/home/data/models/remove_fav_dto.dart';

class RemoveFav {
  final int? favId;

  RemoveFav({this.favId});
}

extension RemoveFavMapper on RemoveFav {
  RemoveFavDto toDto() => RemoveFavDto(favId: favId);
}
