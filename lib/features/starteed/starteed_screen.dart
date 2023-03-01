import 'package:flutter/material.dart';

import '../../shared/shared.dart';

class StarteedScreen extends StatelessWidget {
  const StarteedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundStartColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Palette.whiteColor,
                    child: Image.asset(
                      width: 45.86,
                      height: 49.65,
                      AssetsConstants.group3_icon,
                    ),
                  ),
                  const Text(
                    "Food for Everyone",
                    style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.w500,
                        color: Palette.whiteColor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Stack(
              children: [
                Positioned(
                  top: 190,
                  right: 0,
                  child: Image.asset(
                    AssetsConstants.person2_img,
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 0,
                  child: Image.asset(
                    AssetsConstants.person1_img,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                    top: 300,
                  ),
                  child: Image.asset(
                    AssetsConstants.rectangle3,
                    fit: BoxFit.fill, // fit the image to the container
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
