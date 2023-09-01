import 'package:equatable/equatable.dart';
import 'package:qr_menu_flutter/product/utilty/base/base_firebase_model.dart';

class HamburgerModel extends Equatable
    with IdModel, BaseFirebaseModel<HamburgerModel> {
  HamburgerModel({
    this.img,
    this.name,
    this.price,
    this.description,
  });

  final String? img;
  final String? name;
  final String? price;
  final String? description;

  @override
  List<Object?> get props => [id, img, name, price, description];

  HamburgerModel copyWith({
    int? id,
    String? img,
    String? name,
    String? price,
    String? description,
  }) {
    return HamburgerModel(
      img: img ?? this.img,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'IMG': img,
      'Name': name,
      'Price': price,
      'Description': description,
    };
  }

  @override
  HamburgerModel fromJson(Map<String, dynamic> json) {
    return HamburgerModel(
      img: json['IMG'] as String?,
      name: json['Name'] as String?,
      price: json['Price'] as String?,
      description: json['Description'] as String?,
    );
  }

  @override
  // TODO: implement id
  String? get id => throw UnimplementedError();
}
