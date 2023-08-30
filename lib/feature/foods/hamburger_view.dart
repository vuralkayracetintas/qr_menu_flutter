// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_network/image_network.dart';
import 'package:kartal/kartal.dart';
import 'package:qr_menu_flutter/feature/home/hv.dart';

class HamburgerView extends ConsumerStatefulWidget {
  const HamburgerView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HamburgerViewState();
}

class _HamburgerViewState extends ConsumerState<HamburgerView> {
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
    final response = ref.watch(homeProvider).yemek ?? [];
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          mainAxisExtent: context.sized.height * 0.34,
        ),
        itemCount: response.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                // TODO fix
                ImageNetwork(
                  image: response[index].image ?? '',
                  height: context.sized.height * 0.18,
                  width: context.sized.width * 0.3,
                ),

                ListTile(
                  title: Text(response[index].title ?? ''),
                  subtitle: Text(response[index].subtitle ?? ''),
                  trailing: Text(response[index].price ?? ''),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
