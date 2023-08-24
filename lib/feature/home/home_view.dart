import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:qr_menu_flutter/product/model/main_category_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
                    return Card(
                      child: ListTile(
                        leading: Container(
                          width: 100,
                          height: 100,
                          color: Colors.red,
                          child: ImageNetwork(
                            image: values[index]?.image ?? '',
                            height: 100,
                            width: 100,
                          ),
                        ),
                        title: Text(values[index]?.name ?? ''),
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
