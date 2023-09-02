import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_menu_flutter/feature/home/hv.dart';

class DemoView extends ConsumerStatefulWidget {
  const DemoView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DemoViewState();
}

class _DemoViewState extends ConsumerState<DemoView> {
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

    return DefaultTabController(
      length: response.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Yemekler'),
          bottom: TabBar(
            tabs: response.map((category) => Tab(text: category.name)).toList(),
          ),
        ),
        body: TabBarView(
          children: response.map((category) {
            return Center(
              child: Column(
                children: [
                  Text('Bu kategoriye ait içerik: $category'),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
