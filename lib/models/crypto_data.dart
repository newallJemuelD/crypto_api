import 'package:flutter/material.dart';

class CryptoData {
  final String name;
  final double  price;

  CryptoData({
    required this.name,
    required this.price,
  });

  factory CryptoData.fromJson(Map<String, dynamic> json) {
    return CryptoData(
      name: json['name'],
      price: json['price'],
    );
  }
}
