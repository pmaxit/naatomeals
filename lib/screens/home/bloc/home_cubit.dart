import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naatomeals/data/models/restaurant.dart';

import '../../../services/restaurant_service.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final Iterable<Restaurant> restaurants;
  final String? error;

  const HomeState._({
    this.isLoading = false,
    this.restaurants = const [],
    this.error,
  });

  // copyWIth
  HomeState copyWith({
    bool? isLoading,
    Iterable<Restaurant>? restaurants,
    String? error,
  }) {
    return HomeState._(
      isLoading: isLoading ?? this.isLoading,
      restaurants: restaurants ?? this.restaurants,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, restaurants, error];
}

// difference between cubit and changenotifier is that cubit is a stream state change controller
// while changenotifier is just called once

// I can create cubit through riverpod stream provider
class HomeCubit extends Cubit<HomeState> {
  final ApiService _apiService;

  HomeCubit(this._apiService) : super(const HomeState._());

  Future<void> getRestaurants() async {
    emit(state.copyWith(isLoading: true));
    try {
      final restaurants = await _apiService.getRestaurants();
      emit(state.copyWith(restaurants: restaurants));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
