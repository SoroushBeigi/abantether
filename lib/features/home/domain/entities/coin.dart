class Coin {
  final int? id;
  final String? name;
  final double? price;
  final String? symbol;
  final String? iconAddress;
  final bool? isFavorite;

  const Coin({
    this.id,
    this.name,
    this.price,
    this.symbol,
    this.iconAddress,
    this.isFavorite,
  });

  Coin copyWith({bool? isFavorite}) => Coin(
        id: id,
        name: name,
        price: price,
        symbol: symbol,
        iconAddress: iconAddress,
        isFavorite: isFavorite ?? this.isFavorite,
      );
}
