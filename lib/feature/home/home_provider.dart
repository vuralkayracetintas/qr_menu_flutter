import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_menu_flutter/product/model/foods_model.dart';
import 'package:qr_menu_flutter/product/model/main_category_model.dart';
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

  Future<void> fecthAndLoad() async {
    await Future.wait([fetchMainCategory()]);
  }
}

class HomeState extends Equatable {
  const HomeState({
    this.mainCategory,
    this.foods,
  });

  final List<MainCategoryModel>? mainCategory;
  final List<FoodsModel>? foods;

  @override
  List<Object?> get props => [mainCategory, foods];

  HomeState copyWith({
    List<MainCategoryModel>? mainCategory,
    List<FoodsModel>? foods,
  }) {
    return HomeState(
      mainCategory: mainCategory ?? this.mainCategory,
      foods: foods ?? this.foods,
    );
  }
}