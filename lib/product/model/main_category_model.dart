import 'package:equatable/equatable.dart';

class MainCategoryModel with EquatableMixin {
  MainCategoryModel({
    this.image,
    this.name,
  });

  factory MainCategoryModel.fromJson(Map<String, dynamic> json) {
    return MainCategoryModel(
      image: json['image'] as String?,
      name: json['name'] as String?,
    );
  }
  final String? image;
  final String? name;

  @override
  List<Object?> get props => [image, name];

  MainCategoryModel copyWith({
    String? image,
    String? name,
  }) {
    return MainCategoryModel(
      image: image ?? this.image,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
    };
  }
}
