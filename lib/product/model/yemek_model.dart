import 'package:equatable/equatable.dart';
import 'package:qr_menu_flutter/product/utilty/base/base_firebase_model.dart';

class YemekModel extends Equatable with IdModel, BaseFirebaseModel<YemekModel> {
  YemekModel({
    this.price,
    this.title,
    this.subtitle,
    this.image,
  });

  final String? price;
  final String? title;
  final String? subtitle;
  final String? image;

  @override
  List<Object?> get props => [price, title, subtitle, image];

  YemekModel copyWith({
    String? price,
    String? title,
    String? subtitle,
    String? image,
  }) {
    return YemekModel(
      price: price ?? this.price,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'title': title,
      'subtitle': subtitle,
      'image': image,
    };
  }

  @override
  YemekModel fromJson(Map<String, dynamic> json) {
    return YemekModel(
      price: json['price'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      image: json['image'] as String?,
    );
  }

  @override
  // TODO: implement id
  String? get id => throw UnimplementedError();
}
