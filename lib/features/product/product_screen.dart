import 'package:flutter/material.dart';
import 'package:food_app/constants/assets_constants.dart';

import '../../common_widgets/widget/card_product.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AssetsConstants.vector),
                  Image.asset(AssetsConstants.shoping_cart),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Delicious food for you",
                style: TextStyle(fontSize: 30),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
              ),
            ),
            Container(
              color: Colors.black54,
              padding: const EdgeInsets.only(left: 10),
              height: 35,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return const Text(
                    "Foods",
                    style: TextStyle(fontSize: 25),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
              ),
            ),
            const Align(
              alignment: Alignment.topRight,
              child: Text("see more"),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: hight * 0.5,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const CardProduct();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
