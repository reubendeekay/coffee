class ProductModel {
  final String? id;
  final String? name;
  final String? type;
  final String? category;
  final double? price;
  final String? imageUrl;

  ProductModel(
      {this.id,
      this.name,
      this.category,
      this.type,
      this.price,
      this.imageUrl});

  factory ProductModel.fromJson(dynamic json) => ProductModel(
        id: json.id,
        name: json["name"],
        category: json["category"],
        type: json["type"],
        price: json["price"].toDouble(),
        imageUrl: json["imageUrl"],
      );
  factory ProductModel.fromMap(dynamic json) => ProductModel(
        name: json["name"],
        category: json["category"],
        type: json["type"],
        price: json["price"].toDouble(),
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "price": price,
        "imageUrl": imageUrl,
        "category": category,
      };
}
