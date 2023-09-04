import 'package:equatable/equatable.dart';
import 'package:qr_menu_flutter/product/utilty/base/base_firebase_model.dart';

class FoodCategoryModel extends Equatable
    with IdModel, BaseFirebaseModel<FoodCategoryModel> {
  const FoodCategoryModel({
    this.name,
  });

  final String? name;

  @override
  List<Object?> get props => [name];

  FoodCategoryModel copyWith({
    String? name,
  }) {
    return FoodCategoryModel(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }

  @override
  FoodCategoryModel fromJson(Map<String, dynamic> json) {
    return FoodCategoryModel(
      name: json['name'] as String?,
    );
  }

  @override
  String? get id => throw UnimplementedError();
}
