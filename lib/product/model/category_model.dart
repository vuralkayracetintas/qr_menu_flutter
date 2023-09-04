import 'package:equatable/equatable.dart';
import 'package:qr_menu_flutter/product/utilty/base/base_firebase_model.dart';

class CategoryModel extends Equatable
    with IdModel, BaseFirebaseModel<CategoryModel> {
  CategoryModel({
    this.img,
    this.name,
  });

  final String? img;
  final String? name;

  @override
  List<Object?> get props => [
        img,
        name,
      ];

  CategoryModel copyWith({
    String? img,
    String? name,
  }) {
    return CategoryModel(
      img: img ?? this.img,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IMG': img,
      'name': name,
    };
  }

  @override
  CategoryModel fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      img: json['IMG'] as String?,
      name: json['name'] as String?,
    );
  }

  @override
  String? get id => throw UnimplementedError();
}
