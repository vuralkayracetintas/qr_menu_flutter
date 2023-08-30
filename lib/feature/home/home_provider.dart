import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_menu_flutter/product/model/food_category_model.dart';
import 'package:qr_menu_flutter/product/model/foods_model.dart';
import 'package:qr_menu_flutter/product/model/main_category_model.dart';
import 'package:qr_menu_flutter/product/model/yemek_model.dart';
import 'package:qr_menu_flutter/product/utilty/firebase/firebase_collections.dart';
import 'package:qr_menu_flutter/product/utilty/firebase/firebase_utility.dart';

class HomeNotifier extends StateNotifier<HomeState> with FirebaseUtility {
  HomeNotifier() : super(const HomeState());

  Future<void> fetchMainCategory() async {
    final newCollectionReferance = FirebaseCollections.mainCategory.reference;

    final response = await newCollectionReferance.withConverter(
      fromFirestore: (snapshot, options) {
        return const MainCategoryModel().fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    ).get();

    if (response.docs.isNotEmpty) {
      final values = response.docs.map((e) => e.data()).toList();
      state = state.copyWith(mainCategory: values);
    }
  }

  Future<void> fetchFoodCategory() async {
    final newCollectionReferance = FirebaseCollections.category.reference;

    final response = await newCollectionReferance.withConverter(
      fromFirestore: (snapshot, options) {
        return const FoodCategoryModel().fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    ).get();
    if (response.docs.isNotEmpty) {
      final values = response.docs.map((e) => e.data()).toList();
      state = state.copyWith(foodCategory: values);
    }
  }

  Future<void> fetchPizza() async {
    final newCollectionReferance = FirebaseCollections.yemek.reference
        .doc('Pizzalar')
        .collection('Cesitler');

    final response = await newCollectionReferance.withConverter(
      fromFirestore: (snapshot, options) {
        return YemekModel().fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    ).get();
    if (response.docs.isNotEmpty) {
      final values = response.docs.map((e) => e.data()).toList();
      state = state.copyWith(yemek: values);
    }
  }

  Future<void> fetchHamburger() async {
    final newCollectionReferance = FirebaseCollections.yemek.reference
        .doc('Hamburger')
        .collection('Cesitler');

    final response = await newCollectionReferance.withConverter(
      fromFirestore: (snapshot, options) {
        return YemekModel().fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    ).get();
    if (response.docs.isNotEmpty) {
      final values = response.docs.map((e) => e.data()).toList();
      state = state.copyWith(yemek: values);
    }
  }

  Future<void> fecthAndLoad() async {
    await Future.wait([
      fetchMainCategory(),
      fetchFoodCategory(),
      fetchPizza(),
      fetchHamburger()
    ]);
  }
}

class HomeState extends Equatable {
  const HomeState({
    this.mainCategory,
    this.foods,
    this.foodCategory,
    this.yemek,
  });

  final List<MainCategoryModel>? mainCategory;
  final List<FoodsModel>? foods;
  final List<FoodCategoryModel>? foodCategory;
  final List<YemekModel>? yemek;

  @override
  List<Object?> get props => [mainCategory, foods, foodCategory];

  HomeState copyWith({
    List<MainCategoryModel>? mainCategory,
    List<FoodsModel>? foods,
    List<FoodCategoryModel>? foodCategory,
    List<YemekModel>? yemek,
  }) {
    return HomeState(
      mainCategory: mainCategory ?? this.mainCategory,
      foods: foods ?? this.foods,
      foodCategory: foodCategory ?? this.foodCategory,
      yemek: yemek ?? this.yemek,
    );
  }
}
