class AddFavDto {
  final int cryptoId;
  AddFavDto(this.cryptoId);

  Map<String, dynamic> toJson() => {'cryptocurrency_id': cryptoId};
}
