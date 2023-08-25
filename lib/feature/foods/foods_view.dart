import 'package:flutter/material.dart';

class FoodsView extends StatelessWidget {
  const FoodsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Yemekler'),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Pizzalar',
              ),
              Tab(
                text: 'Hamburgerler',
              ),
              Tab(
                text: 'Makarnalar',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text("It's cloudy here"),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
  }
}



/*

FutureBuilder(
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
      )

*/
