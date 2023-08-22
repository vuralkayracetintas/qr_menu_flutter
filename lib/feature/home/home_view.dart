import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: context.padding.low,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  shape: CircleBorder(side: BorderSide.none),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/images/burger.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage('lib/assets/images/burger.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/images/burger.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  color: Theme.of(context).colorScheme.error,
                  elevation:
                      5, // Gölge eklemek için elevation değeri ayarlayabilirsiniz
                  shape: CircleBorder(),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('lib/assets/images/burger.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Theme.of(context).colorScheme.error,
                  elevation:
                      5, // Gölge eklemek için elevation değeri ayarlayabilirsiniz
                  shape: CircleBorder(),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('lib/assets/images/burger.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Theme.of(context).colorScheme.error,
                  elevation:
                      5, // Gölge eklemek için elevation değeri ayarlayabilirsiniz
                  shape: CircleBorder(),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('lib/assets/images/burger.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
