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
    final response = ref.watch(homeProvider).pizza ?? [];
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          mainAxisExtent: context.sized.height * 0.34,
          //! TODO responsive fix
        ),
        itemCount: response.length,
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              onTap: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text(response[index].title ?? ''),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            response[index].image ?? '',
                            height: context.sized.height * 0.18,
                            width: context.sized.width * 0.3,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(child: Text(response[index].subtitle ?? '')),
                        ],
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      response[index].image ?? '',
                    ),
                  ),
                  // child: ImageNetwork(
                  //   image: response[index].image ?? '',
                  //   height: context.sized.height * 0.18,
                  //   width: context.sized.width * 0.3,
                  //   fitWeb: BoxFitWeb.fill,
                  // ),

                  ListTile(
                    title: Text(
                      response[index].title ?? '',
                      //maxLines: 1,
                      style: context.general.textTheme.titleMedium?.copyWith(),
                    ),
                    subtitle: Text(response[index].price ?? ''),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
