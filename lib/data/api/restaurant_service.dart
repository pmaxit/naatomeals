import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/restaurant.dart';

class ApiService {
  // get all restaurants from firebase
  Future<List<Restaurant>> getRestaurants() async {
    // firestore instance
    final firestore = FirebaseFirestore.instance;
    List<Restaurant> restaurants = [];
    // get all restaurants
    return firestore.collection("restaurants").get().then((value) {
      value.docs.forEach((element) {
        restaurants.add(Restaurant.fromJson(element.data()));
        print(element.data());
      });
    }).then((value) => restaurants);
  }
}

// get the provider instance
final apiService = ApiService();

FutureProvider apiServiceProvider = FutureProvider((ref) async {
  return await apiService.getRestaurants();
});
