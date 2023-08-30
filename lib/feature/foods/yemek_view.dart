// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_network/image_network.dart';
import 'package:kartal/kartal.dart';
import 'package:qr_menu_flutter/feature/home/hv.dart';

class PizzaView extends ConsumerStatefulWidget {
  const PizzaView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PizzaViewState();
}

class _PizzaViewState extends ConsumerState<PizzaView> {
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
      body: ListView.builder(
        itemCount: response.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Card(
                child: ListTile(
                  title: Text(response[index].title ?? ''),
                  subtitle: Text(response[index].subtitle ?? ''),
                  trailing: Text(response[index].price ?? ''),
                ),
              ),
              ImageNetwork(
                image: response[index].image ?? '',
                height: context.sized.height * 0.18,
                width: context.sized.width * 0.3,
              )
            ],
          );
        },
      ),
    );
  }
}
