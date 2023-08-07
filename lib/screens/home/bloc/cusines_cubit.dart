import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naatomeals/services/restaurant_service.dart';

import '../../../data/models/menu.dart';

class CuisineState extends Equatable {
  final bool isLoading;
  final String error;
  final List<Cuisines> cuisines;

  const CuisineState(
      {required this.cuisines, this.isLoading = false, this.error = ""});

  @override
  List<Object?> get props => [cuisines];

  // copyWith
  CuisineState copyWith({
    bool? isLoading,
    String? error,
    List<Cuisines>? cuisines,
  }) {
    return CuisineState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      cuisines: cuisines ?? this.cuisines,
    );
  }
}

class CuisineCubit extends Cubit<CuisineState> {
  final ApiService _apiService;

  CuisineCubit(this._apiService) : super(const CuisineState(cuisines: []));

  Future<void> getCuisines() async {
    emit(state.copyWith(isLoading: true));
    try {
      final cuisines = await _apiService.getCuisines();
      print('>>>>>>>> cuisines: $cuisines');
      emit(state.copyWith(cuisines: cuisines));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}

// get the provider instance
final cuisineCubitProvider =
    Provider<CuisineCubit>((ref) => CuisineCubit(ref.read(apiProvider)));
