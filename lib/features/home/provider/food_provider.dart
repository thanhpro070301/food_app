import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/shared_provider/shared_providers.dart';
import '../controller/food_controller.dart';
import '../data/api/food_api.dart';
import '../data/model/food_model/food_model.dart';
import '../data/repository/food_repo.dart';

final foodApiProvider = Provider<FoodAPI>((ref) {
  final dioClient = ref.read(dioClientProvider);
  return FoodAPI(dioClient: dioClient);
});

final foodRepositoryProvider = Provider<FoodRepository>((ref) {
  final foodAPI = ref.read(foodApiProvider);
  return FoodRepository(foodAPI: foodAPI);
});

final isLoadingFoodProvider = StateProvider<bool>((ref) {
  return true;
});

final foodControllerProvider =
    StateNotifierProvider<FoodNotifier, List<FoodModel>>((ref) {
  return FoodNotifier(ref: ref);
});
