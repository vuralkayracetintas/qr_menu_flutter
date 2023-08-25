import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_menu_flutter/product/model/foods_model.dart';

class FoodsView extends StatelessWidget {
  const FoodsView({super.key});

  @override
  Widget build(BuildContext context) {
    final CollectionReference foods =
        FirebaseFirestore.instance.collection('foods');

    final response = foods.withConverter(
      fromFirestore: (snapshot, options) {
        return FoodsModel().fromFirebase(snapshot);
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
          AsyncSnapshot<QuerySnapshot<FoodsModel?>> snapshot,
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
                      child: Column(children: [
                        Text(values[index]?.title ?? ''),
                        Text(values[index]?.subtitle ?? ''),
                      ]),
                    );
                  },
                );
              } else {
                return const Text('else');
              }
          }
        },
      ),
    );
  }
}
