import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:naatomeals/data/models/menu.dart';
import 'package:naatomeals/extensions/ui_theming.dart';

class RestaurantCard extends StatelessWidget {
  final MenuItem? menu;
  final String? image;
  const RestaurantCard({super.key, required this.menu, this.image});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 10.0, bottom: 20.0),
          child: Material(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                onTap: () {},
                child: CachedNetworkImage(
                  imageUrl: image ?? '',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: menu?.items.length,
              itemBuilder: (context, index) {
                return Container(
                    height: 30,
                    child: Text(menu?.items[index]['name'],
                        style:
                            context.h6.copyWith(fontWeight: FontWeight.bold)));
              }),
        ),
      ),
    ]);
  }
}
