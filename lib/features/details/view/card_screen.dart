import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_app/core/constants/theme_constants/theme.dart';
import '../../../common/widget/button_food_app.dart';
import '../../../common/widget/slidable_action.dart';
import '../../../common/widget/toals.dart';
import '../../../gen/assets.gen.dart';
import '../../home/data/model/food_model/food_model.dart';
import '../model/card_model/card_model.dart';
import '../provider/provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  final String foodID;
  final String cateId;
  final String cateName;
  final String foodName;
  final int price;
  final String description;

  const CartScreen({
    super.key,
    required this.foodName,
    required this.foodID,
    required this.cateName,
    required this.price,
    required this.cateId,
    required this.description,
  });

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  void addIntoCard(String foodID) {
    ref.read(cartControllerProvider.notifier).addCartItem(
          FoodModel(
            cateId: widget.cateId,
            cateName: widget.cateName,
            description: widget.description,
            foodId: widget.foodID,
            foodName: widget.foodName,
            images: [],
            price: widget.price,
          ),
          foodID,
        );
  }

  void removeCard(CartItem item, int index) {
    ref.read(cartControllerProvider.notifier).removeCartItem(item.food);
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = ref.watch(cartControllerProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),
      appBar: _appBar(context),
      body: cartItems.isEmpty ? _cardEmpty() : _bodyCard(cartItems),
    );
  }

  Column _bodyCard(List<CartItem> cartItems) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return _slidable(cartItems, index, context, item);
            },
          ),
        ),
        _buttonFoodApp(),
      ],
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 30.h,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: const Text(
        'My Cart',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Slidable _slidable(List<CartItem> cartItems, int index, BuildContext context,
      CartItem item) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableActions(
            backGroundColor: const Color.fromARGB(255, 199, 67, 127),
            icon: CupertinoIcons.heart_solid,
            label: "Like",
            ref: ref,
            onTap: () {},
          ),
          SlidableActions(
            icon: CupertinoIcons.delete,
            backGroundColor: Palette.backgroundStartColor,
            label: "Delete",
            ref: ref,
            onTap: () {
              ref
                  .read(cartControllerProvider.notifier)
                  .removeAllCartItem(cartItems[index]);
              toalsErr(context, "Delete food from cart.");
            },
          ),
        ],
      ),
      child: _cardItem(cartItems, index, item),
    );
  }

  Center _cardEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.images.group66.path),
          SizedBox(height: 30.h),
          Text(
            'Your cart is empty!!!',
            style: TextStyle(fontSize: 30.h),
          ),
        ],
      ),
    );
  }

  ClipRRect _cardItem(List<CartItem> cartItems, int index, CartItem item) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(45.h),
      child: Card(
        elevation: 2,
        child: ListTile(
          contentPadding: EdgeInsets.all(30.h),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(100.h),
            child: SizedBox(
              width: 70.h,
              height: 200.h,
              child: Image.network(
                cartItems[index].food.images[0].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(item.food.foodName),
          subtitle: Text(item.food.description),
          trailing: Container(
            width: 110.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.h),
                color: Palette.backgroundOrange1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                  onPressed: () => removeCard(item, index),
                ),
                Text(
                  cartItems[index].quantity.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.h),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () => addIntoCard(cartItems[index].food.foodId),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ButtonFoodApp _buttonFoodApp() {
    return ButtonFoodApp(
      color: Palette.backgroundOrange1,
      onTap: () {},
      text: "Complete order",
      textColor: Colors.white,
    );
  }
}
