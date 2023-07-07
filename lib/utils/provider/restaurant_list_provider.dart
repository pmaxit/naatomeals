import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naatomeals/utils/provider/response_state.dart';

import '../../data/api/restaurant_service.dart';
import '../../data/models/restaurant_list.dart';

class RestaurantListProvider extends ChangeNotifier {
  RestaurantListResponse? _restaurantListResponse;
  ResponseState? _responseState;

  late String _message;

  RestaurantListResponse? get restaurantListResponse => _restaurantListResponse;

  ResponseState? get responseState => _responseState;

  String get message => _message;

  dynamic get refreshData => fetchRestaurantList();

  Future<dynamic> fetchRestaurantList() async {
    print('trying to fetch restaurant list');
    _responseState = ResponseState.loading;
    notifyListeners();

    try {
      final response = await RestaurantListService.getRestaurantList();
      if (response.statusCode == 200) {
        _responseState = ResponseState.hasData;
        _restaurantListResponse = response;
        notifyListeners();
        return _restaurantListResponse;
      } else {
        _responseState = ResponseState.error;
        _message = response.message ?? '';
        notifyListeners();
        return _message;
      }
    } catch (e) {
      _responseState = ResponseState.error;
      _message = e.toString();
      notifyListeners();
      return _message;
    }
  }
}

final restaurantListProvider = ChangeNotifierProvider<RestaurantListProvider>(
    (ref) => RestaurantListProvider());
