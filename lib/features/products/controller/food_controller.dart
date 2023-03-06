import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/model/food_model/food_model.dart';
import '../provider/food_provider.dart';

class FoodNotifier extends StateNotifier<List<FoodModel>> {
  final Ref _ref;
  FoodNotifier({required Ref ref})
      : _ref = ref,
        super([]) {
    fetchFood(ref: _ref);
  }

  void fetchFood({required Ref ref}) {
    ref.read(foodRepositoryProvider).fetchFood().then(
      (res) {
        res.fold(
          (failure) {
            log('Failed to fetch categories: ${failure.message}');
          },
          (categories) {
            state = categories;
          },
        );
        ref.read(isLoadingFoodProvider.notifier).state = false;
      },
    );
  }
}
