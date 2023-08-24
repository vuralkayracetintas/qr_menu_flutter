import 'package:equatable/equatable.dart';
import 'package:qr_menu_flutter/product/utilty/base/base_firebase_model.dart';

class MainCategoryModel extends Equatable
    with IdModel, BaseFirebaseModel<MainCategoryModel> {
  const MainCategoryModel({
    this.image,
    this.name,
    this.id,
  });

  final String? image;
  final String? name;
  @override
  final String? id;

  @override
  List<Object?> get props => [image, name, id];

  MainCategoryModel copyWith({
    String? image,
    String? name,
    String? id,
  }) {
    return MainCategoryModel(
      image: image ?? this.image,
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'id': id,
    };
  }

  @override
  MainCategoryModel fromJson(Map<String, dynamic> json) {
    return MainCategoryModel(
      image: json['image'] as String?,
      name: json['name'] as String?,
      id: json['id'] as String?,
    );
  }
}
