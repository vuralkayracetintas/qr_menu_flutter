import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_menu_flutter/feature/foods/hamburger_view.dart';
import 'package:qr_menu_flutter/feature/foods/yemek_view.dart';
import 'package:qr_menu_flutter/feature/home/hv.dart';

class FoodsView extends ConsumerStatefulWidget {
  const FoodsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FoodsViewState();
}

class _FoodsViewState extends ConsumerState<FoodsView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        ref.read(homeProvider.notifier).fecthAndLoad();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final response = ref.watch(homeProvider).foodCategory ?? [];
    return DefaultTabController(
      length: response.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Yemekler'),
          bottom: TabBar(
            isScrollable: true,
            tabs: response.map((item) {
              return Tab(
                text: item.name ?? '',
              );
            }).toList(),
          ),
        ),
        //! kategoriye gore yemeklerin listelenecegi yer
        body: const TabBarView(
          children: [
            HamburgerView(),
            Center(
              child: Text("It's sunny here"),
            ),
            Center(
              child: Text("It's  here"),
            ),
            Center(
              child: Text("It's sunny "),
            ),
            Center(
              child: Text("'s sunny here"),
            ),
            Center(
              child: Text("It's  here"),
            ),
            PizzaView(),
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