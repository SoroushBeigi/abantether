class AddFavDto {
  final int? cryptoId;
  const AddFavDto({this.cryptoId});

  Map<String, dynamic> toJson() => {'cryptocurrency_id': cryptoId};
}
