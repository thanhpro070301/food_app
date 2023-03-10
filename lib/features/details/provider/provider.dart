import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/controller.dart';
import '../model/card_model/card_model.dart';

final cartControllerProvider =
    StateNotifierProvider<CartModel, List<CartItem>>((ref) {
  return CartModel();
});
