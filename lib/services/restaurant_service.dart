import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/models/restaurant.dart';
import '../data/models/user.dart';

class ApiService {
  // get specific user from firebase
  Future<User> getUser(String uid) async {
    // firestore instance
    final firestore = FirebaseFirestore.instance;
    // get user
    return firestore.collection("users").doc(uid).get().then((value) {
      return User.fromJson(value.data()!);
    });
  }

  // get all restaurants from firebase
  Future<List<Restaurant>> getRestaurants() async {
    // firestore instance
    final firestore = FirebaseFirestore.instance;
    List<Restaurant> restaurants = [];
    // get all restaurants
    return firestore.collection("restaurants").get().then((value) {
      value.docs.forEach((element) {
        restaurants.add(Restaurant.fromJson(element.data()));
      });
    }).then((value) => restaurants);
  }
}

// get the provider instance
final apiService = ApiService();

final apiProvider = Provider((ref) => apiService);

FutureProvider apiServiceProvider = FutureProvider((ref) async {
  return await apiService.getRestaurants();
});
