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
          children: [
            SizedBox(height: 20),
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
                  SizedBox(height: 20),
                  Image.asset(AssetsConstants.feo)
                ],
              ),
            ),
            const SizedBox(height: 10),
            Spacer(),
            SizedBox(
              height: 500,
              child: Stack(
                children: [
                  Positioned(
                    top: 200,
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
                  Positioned(
                    bottom: -80,
                    left: -50,
                    child: Image.asset(
                      AssetsConstants.rectangle3,
                    ),
                  ),
                  Positioned(
                    bottom: -70,
                    right: -220,
                    child: Image.asset(
                      AssetsConstants.rectangle5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 39),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Get starteed",
                            style: TextStyle(color: Palette.orangeColor),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Palette.whiteColor,
                              fixedSize: Size(300, 65),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
