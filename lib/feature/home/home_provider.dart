import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_menu_flutter/product/model/category_model.dart';
import 'package:qr_menu_flutter/product/model/food_category_model.dart';
import 'package:qr_menu_flutter/product/model/foods_model.dart';
import 'package:qr_menu_flutter/product/model/main_category_model.dart';

import 'package:qr_menu_flutter/product/utilty/firebase/firebase_collections.dart';
import 'package:qr_menu_flutter/product/utilty/firebase/firebase_utility.dart';

class HomeNotifier extends StateNotifier<HomeState> with FirebaseUtility {
  HomeNotifier() : super(HomeState());

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

  Future<void> fetchCategory() async {
    final newCollectionReferance = FirebaseCollections.Category.reference;

    final response = await newCollectionReferance.withConverter(
      fromFirestore: (snapshot, options) {
        return CategoryModel().fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    ).get();

    if (response.docs.isNotEmpty) {
      final values = response.docs.map((e) => e.data()).toList();
      state = state.copyWith(Category: values);
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
    final newCollectionReferance = FirebaseCollections.Category.reference
        .doc('Yemekler')
        .collection('Pizzalar');

    final response = await newCollectionReferance.withConverter(
      fromFirestore: (snapshot, options) {
        return FoodsModel().fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    ).get();
    if (response.docs.isNotEmpty) {
      final values = response.docs.map((e) => e.data()).toList();

      state = state.copyWith(pizza: values);
    }
  }

  Future<void> fetchMakarna() async {
    final newCollectionReferance = FirebaseCollections.Category.reference
        .doc('Yemekler')
        .collection('Makarnalar');

    final response = await newCollectionReferance.withConverter(
      fromFirestore: (snapshot, options) {
        return FoodsModel().fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    ).get();
    if (response.docs.isNotEmpty) {
      final values = response.docs.map((e) => e.data()).toList();
      state = state.copyWith(makarna: values);
    }
  }

  Future<void> fetchHamburger() async {
    final newCollectionReferance = FirebaseCollections.Category.reference
        .doc('Yemekler')
        .collection('Hamburgerler');

    final response = await newCollectionReferance.withConverter(
      fromFirestore: (snapshot, options) {
        return FoodsModel().fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    ).get();
    if (response.docs.isNotEmpty) {
      final values = response.docs.map((e) => e.data()).toList();
      state = state.copyWith(hamburger: values);
    }
  }

  Future<void> fecthAndLoad() async {
    await Future.wait([
      fetchCategory(),
      fetchMainCategory(),
      fetchFoodCategory(),
      fetchPizza(),
      fetchHamburger(),
      fetchMakarna(),
    ]);
  }
}

// Future<void> fetchSubCollections() async {
//   final categoryCollectionRef = FirebaseCollections.Category.reference;

//   final categoryDocument = await categoryCollectionRef.doc('Yemekler').get();

//   if (categoryDocument.exists) {
//     final pizzasCollectionRef =
//         categoryDocument.reference.collection('Hamburgerler');
//     final makarnalarCollectionRef =
//         categoryDocument.reference.collection('Makarnalar');

//     final pizzasQuerySnapshot = await pizzasCollectionRef.get();
//     if (pizzasQuerySnapshot.docs.isNotEmpty) {
//       pizzasQuerySnapshot.docs.forEach((pizzasDocument) {
//         print('Hamburger Belge ID: ${pizzasDocument.id}');
//         print('Hamburger Veri: ${pizzasDocument.data()}');
//       });
//     } else {
//       print('Pizza koleksiyonunda belge bulunamadı.');
//     }

//     final makarnalarQuerySnapshot = await makarnalarCollectionRef.get();
//     if (makarnalarQuerySnapshot.docs.isNotEmpty) {
//       makarnalarQuerySnapshot.docs.forEach((makarnalarDocument) {
//         print('Makarna Belge ID: ${makarnalarDocument.id}');
//         print('Makarna Veri: ${makarnalarDocument.data()}');
//       });
//     } else {
//       print('Makarna koleksiyonunda belge bulunamadı.');
//     }
//   } else {
//     print('Ana belge bulunamadı.');
//   }
// }

class HomeState extends Equatable {
  HomeState({
    this.mainCategory,
    this.hamburger,
    this.foodCategory,
    this.pizza,
    this.Category,
    this.makarna,
  });

  final List<MainCategoryModel>? mainCategory;
  final List<FoodCategoryModel>? foodCategory;
  final List<FoodsModel>? pizza;
  final List<FoodsModel>? hamburger;
  final List<FoodsModel>? makarna;
  final List<CategoryModel>? Category;

  @override
  List<Object?> get props =>
      [mainCategory, foodCategory, hamburger, pizza, Category];

  HomeState copyWith({
    List<MainCategoryModel>? mainCategory,
    List<FoodsModel>? hamburger,
    List<FoodsModel>? makarna,
    List<FoodsModel>? pizza,
    List<FoodCategoryModel>? foodCategory,
    List<CategoryModel>? Category,
  }) {
    return HomeState(
      mainCategory: mainCategory ?? this.mainCategory,
      hamburger: hamburger ?? this.hamburger,
      foodCategory: foodCategory ?? this.foodCategory,
      pizza: pizza ?? this.pizza,
      Category: Category ?? this.Category,
      makarna: makarna ?? this.makarna,
    );
  }
}
