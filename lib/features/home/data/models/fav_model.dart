class FavModel {
  final int? id;
  final int? cryptoId;
  final int? userId;
  
  const FavModel({
    this.id,
    this.cryptoId,
    this.userId,
  });

  factory FavModel.fromJson(Map<String, dynamic> json) {
    return FavModel(
      id: json['id'],
      cryptoId: json['cryptocurrency_id'],
      userId: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cryptocurrency_id': cryptoId,
      'user_id': userId,
    };
  }
}