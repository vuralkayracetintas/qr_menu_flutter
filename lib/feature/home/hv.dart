import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:kartal/kartal.dart';
import 'package:qr_menu_flutter/feature/dessert/dessert_view.dart';
import 'package:qr_menu_flutter/feature/drinks/drinks_view.dart';
import 'package:qr_menu_flutter/feature/foods/foods_view.dart';
import 'package:qr_menu_flutter/product/model/main_category_model.dart';

class HomeView2 extends StatefulWidget {
  const HomeView2({super.key});

  @override
  State<HomeView2> createState() => _HomeView2State();
}

class _HomeView2State extends State<HomeView2> {
  @override
  Widget build(BuildContext context) {
    final CollectionReference mainCategory =
        FirebaseFirestore.instance.collection('mainCategory');

    final response = mainCategory.withConverter(
      fromFirestore: (snapshot, options) {
        return const MainCategoryModel().fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        //if (value == null) throw FirebaseCustomException('$value is null');
        return value.toJson();
      },
    ).get();

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: response,
        builder: (
          context,
          AsyncSnapshot<QuerySnapshot<MainCategoryModel?>> snapshot,
        ) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('none');
            case ConnectionState.waiting:
              return const Text('waiting');
            case ConnectionState.active:
              return const Text('active');
            case ConnectionState.done:
              if (snapshot.hasData) {
                final values =
                    snapshot.data!.docs.map((e) => e.data()).toList();

                return ListView.builder(
                  itemCount: values.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: context.padding.low,
                      child: InkWell(
                        onTap: () {
                          if (values[index]?.name == 'Yemekler') {
                            Navigator.push(
                              context,
                              MaterialPageRoute<FoodsView>(
                                builder: (context) => const FoodsView(),
                              ),
                            );
                          } else if (values[index]?.name == 'Icecekler') {
                            Navigator.push(
                              context,
                              MaterialPageRoute<DrinksView>(
                                builder: (context) => const DrinksView(),
                              ),
                            );
                          } else if (values[index]?.name == 'Tatlilar') {
                            Navigator.push(
                              context,
                              MaterialPageRoute<DessertView>(
                                builder: (context) => const DessertView(),
                              ),
                            );
                          }
                        },
                        child: Card(
                          child: SizedBox(
                            height: context.sized.height * 0.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ImageNetwork(
                                  image: values[index]?.image ?? '',
                                  height: context.sized.height * 0.18,
                                  width: context.sized.width * 0.3,
                                ),
                                Text(
                                  values[index]?.name ?? '',
                                  style: context.general.textTheme.displaySmall
                                      ?.copyWith(
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Text('no data');
              }
          }
        },
      ),
    );
  }
}
