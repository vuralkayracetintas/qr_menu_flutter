// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:qr_menu_flutter/feature/home/hv.dart';

class YemekView extends ConsumerStatefulWidget {
  const YemekView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _YemekViewState();
}

class _YemekViewState extends ConsumerState<YemekView> {
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
      appBar: AppBar(
        title: const Text('dememe'),
      ),
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
            ],
          );
        },
      ),
    );
  }
}
