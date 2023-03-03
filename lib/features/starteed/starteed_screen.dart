import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../constants/assets_constants.dart';
import '../../constants/theme/pallete.dart';
import '../../common_widgets/widget/button_food_app.dart';

class StarteedScreen extends StatelessWidget {
  const StarteedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundStartColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
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
                  const SizedBox(height: 20),
                  Image.asset(AssetsConstants.feo)
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Spacer(),
            SizedBox(
              height: 400,
              child: Stack(
                children: [
                  Positioned(
                    top: 50,
                    right: 0,
                    child: Image.asset(
                      AssetsConstants.person2_img,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 0,
                    child: Image.asset(
                      AssetsConstants.person1_img,
                    ),
                  ),
                  Positioned(
                    bottom: -120,
                    left: -50,
                    child: Image.asset(
                      AssetsConstants.rectangle3,
                    ),
                  ),
                  Positioned(
                    bottom: -120,
                    right: -140,
                    child: Image.asset(
                      AssetsConstants.rectangle5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ButtonFoodApp(
                        text: "Get starteed",
                        color: Palette.whiteColor,
                        textColor: Palette.backgroundOrange1,
                        onTap: () {
                          context.go("/auth");
                        },
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
