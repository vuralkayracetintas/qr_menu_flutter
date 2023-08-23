import 'package:equatable/equatable.dart';

class MainCategoryModel extends Equatable {
  const MainCategoryModel({
    this.image,
    this.name,
    this.id,
  });

  factory MainCategoryModel.fromJson(Map<String, dynamic> json) {
    return MainCategoryModel(
      image: json['image'] as String?,
      name: json['name'] as String?,
      id: json['id'] as String?,
    );
  }
  final String? image;
  final String? name;
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
}
