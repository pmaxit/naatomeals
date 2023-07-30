import 'package:flutter/material.dart';
import 'package:naatomeals/data/models/menu.dart';

class RestaurantCard extends StatelessWidget {
  final MenuCategory menuCategory;
  const RestaurantCard({super.key, required this.menuCategory});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: AspectRatio(
          aspectRatio: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Image.asset('assets/images/1.png', width: 50, height: 50),
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                    child: Text("Item $index",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold)));
              }),
        ),
      ),
    ]);
  }
}
