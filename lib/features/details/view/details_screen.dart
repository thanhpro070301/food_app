import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/common/common.dart';
import 'package:food_app/common/widget/text_style.dart';
import 'package:food_app/core/constants/theme_constants/theme.dart';
import 'package:food_app/features/details/provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../home/data/model/food_model/food_model.dart';

import '../../home/data/model/image_model/image_model.dart';
import 'card_screen.dart';

class DetailsScreen extends ConsumerStatefulWidget {
  final String foodID;
  final String cateId;
  final String cateName;
  final String foodName;
  final int price;
  final String description;
  final List<ImageModel> images;
  DetailsScreen({
    super.key,
    required this.foodName,
    required this.foodID,
    required this.cateName,
    required this.price,
    required this.cateId,
    required this.description,
    required this.images,
  });
  final _controllerPageView = PageController();
  @override
  ConsumerState<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {
  void addIntoCard() {
    ref.read(cartControllerProvider.notifier).addCartItem(
        FoodModel(
          cateId: widget.cateId,
          cateName: widget.cateName,
          description: widget.description,
          foodId: widget.foodID,
          foodName: widget.foodName,
          images: widget.images,
          price: widget.price,
        ),
        widget.foodID);
    toalsSuccess(context, "Added food to cart.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),
      appBar: _appBar(context),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                _imageDetails(),
                SizedBox(height: 10.h),
                _smoothPageIndicator()
              ],
            ),
          ),
          SizedBox(height: 30.h),
          _foodName(),
          SizedBox(height: 20.h),
          _price(),
          SizedBox(height: 20.h),
          const Text("Delivery info "),
          _description(),
          const Spacer(),
          _buttonFoodApp(),
        ],
      ),
      floatingActionButton: _buttonToCard(context),
    );
  }


  FloatingActionButton _buttonToCard(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartScreen(
              cateId: widget.cateId,
              cateName: widget.cateName,
              description: widget.description,
              foodID: widget.foodID,
              foodName: widget.foodName,
              price: widget.price,
            ),
          ),
        );
      },
      child: const Icon(Icons.shopping_cart),
    );
  }

  ButtonFoodApp _buttonFoodApp() {
    return ButtonFoodApp(
      color: Palette.backgroundOrange1,
      onTap: addIntoCard,
      text: "Add to card",
      textColor: Colors.white,
    );
  }

  Padding _description() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 25.w,
        vertical: 15.h,
      ),
      child: RichText(
        textWidthBasis: TextWidthBasis.parent,
        softWrap: true,
        text: TextSpan(
          text: "abc",
          style: TextStyle(
            color: Colors.pink,
            fontSize: 16.h,
          ),
        ),
      ),
    );
  }

  Center _price() {
    return Center(
      child: TextSmallStyle(
        text: "${widget.price} nghìn ",
        size: 25.h,
      ),
    );
  }

  Text _foodName() {
    return Text(
      widget.foodName,
      style: const TextStyle(
        fontSize: 30,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  SmoothPageIndicator _smoothPageIndicator() {
    return SmoothPageIndicator(
      controller: widget._controllerPageView,
      count: widget.images.length,
      effect: JumpingDotEffect(
        activeDotColor: Palette.backgroundOrange1,
        dotColor: Colors.deepOrange.shade200,
        dotWidth: 15.h,
        dotHeight: 15.h,
        verticalOffset: 5,
        spacing: 14.h,
      ),
    );
  }

  Container _imageDetails() {
    return Container(
      height: 220.h,
      width: 220.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(150.h),
      ),
      child: PageView.builder(
        controller: widget._controllerPageView,
        itemCount: widget.images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(150.h),
              child: Image.network(
                widget.images[index].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
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
      actions: [
        IconButton(
          icon: Icon(
            Icons.favorite_border_outlined,
            color: Colors.black,
            size: 30.h,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
