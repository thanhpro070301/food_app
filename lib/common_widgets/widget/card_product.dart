import 'package:flutter/material.dart';
import '../../constants/assets_constants.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 321,
      width: 250,
      child: Stack(
        children: [
          Positioned(
            top: 50,
            left: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Card(
                color: Colors.deepOrange,
                child: SizedBox(
                  height: 270,
                  width: 220,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        height: 50,
                      ),
                      Text("Veggies tomato mix"),
                      Text("N1.900"),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 30,
            child: Container(
              height: 164.16,
              width: 164.16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.lightBlue,
                image: const DecorationImage(
                  image: AssetImage(AssetsConstants.menu_icon),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
