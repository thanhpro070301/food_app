import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../home/data/model/food_model/food_model.dart';
import '../controller/controller.dart';

final cartControllerProvider =
    StateNotifierProvider<CartModel, List<CartItem>>((ref) {
  return CartModel();
});
final selectedFoodProvider = StateProvider<FoodModel?>((ref) => null);
