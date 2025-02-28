class CoinModel {
  final int? id;
  final String? name;
  final double? price;
  final String? symbol;
  final String? iconAddress;
  final bool? isFavorite;

  const CoinModel({
    this.id,
    this.name,
    this.price,
    this.symbol,
    this.iconAddress,
    this.isFavorite,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      id: json['id'],
      name: json['name'],
      price: json['price']?.toDouble(),
      symbol: json['symbol'],
      iconAddress: json['icon_address'],
      isFavorite: json['is_favorite'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'symbol': symbol,
      'icon_address': iconAddress,
      'is_favorite': isFavorite,
    } as Map<String, dynamic>;
  }
}