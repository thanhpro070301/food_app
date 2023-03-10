import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../home/data/model/food_model/food_model.dart';
import '../model/card_model/card_model.dart';

class CartModel extends StateNotifier<List<CartItem>> {
  CartModel() : super([]);

  void addCartItem(
    FoodModel food,
    String foodID,
  ) {
    final existingItemIndex = state.indexWhere((item) =>
        item.food.foodId == food.foodId || item.food.foodId == foodID);
    if (existingItemIndex != -1) {
      state[existingItemIndex].quantity++;
      state = [...state];
    } else {
      state = [...state, CartItem(food: food)];
    }
  }

  void removeCartItem(FoodModel food) {
    final existingItemIndex =
        state.indexWhere((item) => item.food.foodId == food.foodId);
    if (existingItemIndex != -1) {
      if (state[existingItemIndex].quantity == 1) {
        state.removeAt(existingItemIndex);
        state = [...state];
      } else {
        state[existingItemIndex] = CartItem(
            food: food, quantity: state[existingItemIndex].quantity - 1);
        state = [...state];
      }
    }
  }

  void removeAllCartItem(CartItem currentItem) {
    state.remove(currentItem);
    state = [...state];
  }
}
