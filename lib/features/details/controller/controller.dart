import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home/data/model/food_model/food_model.dart';

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

  void removeCurrentCartItem(CartItem currentItem) {
    state.remove(currentItem);
    state = [...state];
  }

  void removeCartItem(FoodModel food) async {
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

  void removeAll(CartItem item) {
    state.remove(item);
    state = [...state];
  }

  void clear() {
    state = [];
  }
}

class CartItem {
  final FoodModel food;
  int quantity;
  CartItem({required this.food, this.quantity = 1});
}
