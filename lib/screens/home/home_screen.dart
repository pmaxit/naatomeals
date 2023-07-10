import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/api/restaurant_service.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantListResponse = ref.watch(restaurantList);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Naato Meals'),
        ),
        body: restaurantListResponse.when(
          data: (data) {
            return ListView.builder(
              itemCount: data.restaurants.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Card(
                    elevation: 2,
                    // radius: 25
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(25),
                      onTap: () {
                        // Navigator.pushNamed(context, Routes.detailScreen,
                        //     arguments: data.restaurants[index].id);
                      },
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(8),
                        leading: Image.network(
                          'https://restaurant-api.dicoding.dev/images/small/${data.restaurants[index].pictureId}',
                          width: 100,
                        ),
                        title: Text(
                          data.restaurants[index].name,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          data.restaurants[index].description,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text(error.toString())),
        ));
  }
}
