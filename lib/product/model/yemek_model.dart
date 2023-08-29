import 'package:equatable/equatable.dart';
import 'package:qr_menu_flutter/product/utilty/base/base_firebase_model.dart';

class Response extends Equatable with IdModel, BaseFirebaseModel<Response> {
  Response({
    this.price,
    this.title,
    this.subtitle,
  });

  String? price;
  String? title;
  String? subtitle;

  @override
  List<Object?> get props => [price, title, subtitle];

  Response copyWith({
    String? price,
    String? title,
    String? subtitle,
  }) {
    return Response(
      price: price ?? this.price,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'title': title,
      'subtitle': subtitle,
    };
  }

  @override
  Response fromJson(Map<String, dynamic> json) {
    return Response(
      price: json['price'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
    );
  }

  @override
  // TODO: implement id
  String? get id => throw UnimplementedError();
}
