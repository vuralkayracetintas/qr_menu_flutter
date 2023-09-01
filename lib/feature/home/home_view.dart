import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kartal/kartal.dart';
import 'package:qr_menu_flutter/feature/dessert/dessert_view.dart';
import 'package:qr_menu_flutter/feature/drinks/drinks_view.dart';
import 'package:qr_menu_flutter/feature/foods/foods_view.dart';
import 'package:qr_menu_flutter/feature/home/home_provider.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
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
    final response = ref.watch(homeProvider).Category ?? [];

    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: response.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: context.padding.low,
            child: Padding(
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
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(
                            response[index].img ?? '',
                            height: context.sized.height * 0.2,
                            width: context.sized.width * 0.3,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            response[index].name ?? '',
                            textAlign: TextAlign.start,
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
              ),
            ),
          );
        },
      ),
    );
  }
}
