// create a restaurant service file in lib/data/api/restaurant_service.dart

import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/restaurant_list.dart';
import 'package:http/http.dart' as http;

class RestaurantListService {
  static const baseUrl = 'https://restaurant-api.dicoding.dev';
  static const getListUrl = '/list';
  static const getImageUrl = '/images/small/';
  static const getDetailUrl = '/detail/';
  static const getSearchUrl = '/search?q=';
  static const addReviewUrl = '/review';

  Future<RestaurantListResponse> getRestaurantList() async {
    var url = Uri.parse(baseUrl + getListUrl);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return RestaurantListResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant list');
    }
  }

  Future<RestaurantListResponse> getRestaurantDetail(String id) async {
    var url = Uri.parse(baseUrl + getDetailUrl + id);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return RestaurantListResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant detail');
    }
  }

  Future<RestaurantListResponse> getSearchRestaurant(String query) {
    var url = Uri.parse(baseUrl + getSearchUrl + query);
    return http.get(url).then((response) {
      if (response.statusCode == 200) {
        return RestaurantListResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load restaurant search');
      }
    });
  }

  Future<RestaurantListResponse> postReview(
      String id, String name, String review) async {
    var url = Uri.parse(baseUrl + addReviewUrl);
    var response =
        await http.post(url, body: {'id': id, 'name': name, 'review': review});
    if (response.statusCode == 200) {
      return RestaurantListResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post review');
    }
  }
}

final apiProvider = Provider<RestaurantListService>((ref) {
  return RestaurantListService();
});

// restuarant list provider
final restaurantList =
    FutureProvider.autoDispose<RestaurantListResponse>((ref) async {
  final api = ref.watch(apiProvider);
  return api.getRestaurantList();
});
