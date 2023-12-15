

import 'package:assign_8/dbhelper/dbhelper.dart';

class Product {
  String sku;
  String name;
  String description;
  double price;
  double dPrice;
  int quantity;
  String manufacturer;

  Product({
    required this.sku,
    required this.name,
    required this.description,
    required this.price,
    required this.dPrice,
    required this.quantity,
    required this.manufacturer
  });

  Map<String, dynamic> toMap() {
    return {
      DbHelper.colSku : sku,
      DbHelper.colName : name,
      DbHelper.colDescription : description,
      DbHelper.colPrice : price,
      DbHelper.colDiscountedPrice : dPrice,
      DbHelper.colQuantity : quantity,
      DbHelper.colManufacturer : manufacturer
    };
  }
}