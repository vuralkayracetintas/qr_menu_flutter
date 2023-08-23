import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_menu_flutter/product/model/main_category_model.dart';
import 'package:qr_menu_flutter/product/utilty/exception/custom_exception.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference mainCategory =
        FirebaseFirestore.instance.collection('mainCategory');

    final response = mainCategory.withConverter(
      fromFirestore: (snapshot, options) {
        final jsonBody = snapshot.data();
        if (jsonBody != null) {
          return MainCategoryModel.fromJson(jsonBody);
        }
        return null;
      },
      toFirestore: (value, options) {
        if (value == null) throw FirebaseCustomException('$value is null');
        return value.toJson();
      },
    );

    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('HomeView'),
      ),
    );
  }
}
