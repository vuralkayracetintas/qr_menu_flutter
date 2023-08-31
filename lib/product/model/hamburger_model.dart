import 'package:equatable/equatable.dart';
import 'package:qr_menu_flutter/product/utilty/base/base_firebase_model.dart';

class HamburgerModel extends Equatable
    with IdModel, BaseFirebaseModel<HamburgerModel> {
  HamburgerModel({
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

  HamburgerModel copyWith({
    String? price,
    String? title,
    String? subtitle,
    String? image,
  }) {
    return HamburgerModel(
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
  HamburgerModel fromJson(Map<String, dynamic> json) {
    return HamburgerModel(
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
