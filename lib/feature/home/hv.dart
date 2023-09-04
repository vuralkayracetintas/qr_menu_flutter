import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_network/image_network.dart';
import 'package:kartal/kartal.dart';
import 'package:qr_menu_flutter/feature/dessert/dessert_view.dart';
import 'package:qr_menu_flutter/feature/drinks/drinks_view.dart';
import 'package:qr_menu_flutter/feature/foods/foods_view.dart';
import 'package:qr_menu_flutter/feature/home/home_provider.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});

class HomeView2 extends ConsumerStatefulWidget {
  const HomeView2({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeView2State();
}

class _HomeView2State extends ConsumerState<HomeView2> {
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
    final response = ref.watch(homeProvider).mainCategory ?? [];

    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: response.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: context.padding.low,
            child: InkWell(
              onTap: () {
                if (response[index].name == 'Yemekler') {
                  Navigator.push(
                    context,
                    MaterialPageRoute<FoodsView>(
                      builder: (context) => const FoodsView(),
                    ),
                  );
                } else if (response[index].name == 'Icecekler') {
                  Navigator.push(
                    context,
                    MaterialPageRoute<DrinksView>(
                      builder: (context) => const DrinksView(),
                    ),
                  );
                } else if (response[index].name == 'Tatlilar') {
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
                        image: response[index].image ?? '',
                        height: context.sized.height * 0.18,
                        width: context.sized.width * 0.3,
                      ),
                      Text(
                        response[index].name ?? '',
                        style: context.general.textTheme.displaySmall?.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(response[index].id ?? ''),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
