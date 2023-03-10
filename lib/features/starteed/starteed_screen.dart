import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../common/common.dart';
import '../../core/constants/theme_constants/pallete.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../gen/assets.gen.dart';

class StarteedScreen extends StatelessWidget {
  const StarteedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundStartColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30.h,
                    backgroundColor: Palette.whiteColor,
                    child: Image.asset(
                      width: 45.86.w,
                      height: 49.65.h,
                      Assets.images.gr3.path,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Image.asset(Assets.images.feo.path),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            const Spacer(),
            SizedBox(
              height: 400.h,
              child: Stack(
                children: [
                  Positioned(
                    top: 50.h,
                    right: 0.h,
                    child: Image.asset(
                      Assets.images.person2Img.path,
                    ),
                  ),
                  Positioned(
                    top: 10.h,
                    left: 0.h,
                    child: Image.asset(
                      Assets.images.person1Img.path,
                    ),
                  ),
                  Positioned(
                    bottom: -120.h,
                    left: -50.h,
                    child: Image.asset(Assets.images.rectangle3.path),
                  ),
                  Positioned(
                    bottom: -120.h,
                    right: -140.h,
                    child: Image.asset(
                      Assets.images.rectangle5.path,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
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
