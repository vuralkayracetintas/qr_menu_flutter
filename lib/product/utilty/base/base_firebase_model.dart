import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_menu_flutter/product/utilty/exception/custom_exception.dart';

mixin IdModel {
  String? get id;
}

mixin BaseFirebaseModel<T extends IdModel> {
  T fromJson(Map<String, dynamic> json);

  T fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final value = snapshot.data();
    if (value == null) {
      throw FirebaseCustomException('$snapshot data is null');
    }
    // fixme
    value.addEntries([MapEntry('id', snapshot.id)]);
    return fromJson(value);
  }
}
