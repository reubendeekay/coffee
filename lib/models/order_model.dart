import 'package:coffee/models/product_model.dart';

class OrderModel {
  final String? id;
  final double? amount;
  final String? size;
  final String? name;
  final String? address;
  final String? city;
  final String? pinCode;
  final String? country;
  final int? quantity;
  final String? pickup;
  final ProductModel? product;

  OrderModel(
      {this.id,
      this.amount,
      this.size,
      this.name,
      this.address,
      this.city,
      this.pinCode,
      this.product,
      this.country,
      this.quantity,
      this.pickup});

  Map<String, dynamic> toJson() => {
        "name": name,
        "size": size,
        "amount": amount,
        "address": address,
        "city": city,
        "pinCode": pinCode,
        "country": country,
        "pickup": pickup,
        "quantity": quantity,
        "product": product!.toJson(),
      };

  factory OrderModel.fromJson(dynamic json) => OrderModel(
        id: json.id,
        amount: json["amount"],
        size: json["size"],
        name: json["name"],
        address: json["address"],
        city: json["city"],
        pinCode: json["pinCode"],
        country: json["country"],
        pickup: json["pickup"],
        quantity: json["quantity"],
        product: ProductModel.fromMap(json["product"]),
      );
}
