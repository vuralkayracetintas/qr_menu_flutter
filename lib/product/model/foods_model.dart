import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qr_menu_flutter/product/utilty/base/base_firebase_model.dart';

@immutable
class FoodsModel extends Equatable with IdModel, BaseFirebaseModel<FoodsModel> {
  FoodsModel({
    this.category,
    this.image,
    this.price,
    this.title,
    this.subtitle,
    this.id,
  });

  final String? category;
  final String? image;
  final String? price;
  final String? title;
  final String? subtitle;
  @override
  final String? id;

  @override
  List<Object?> get props => [category, image, price, title, subtitle];

  FoodsModel copyWith({
    String? category,
    String? image,
    String? price,
    String? title,
    String? subtitle,
    String? id,
  }) {
    return FoodsModel(
      category: category ?? this.category,
      image: image ?? this.image,
      price: price ?? this.price,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'image': image,
      'price': price,
      'title': title,
      'subtitle': subtitle,
      'id': id,
    };
  }

  @override
  FoodsModel fromJson(Map<String, dynamic> json) {
    return FoodsModel(
      category: json['category'] as String?,
      image: json['image'] as String?,
      price: json['price'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      id: json['id'] as String?,
    );
  }
}
