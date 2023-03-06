import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/constants.dart';
import '../../common/common.dart';
import '../../core/constants/theme_constants/pallete.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                      AssetsConstants.group3_icon,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Image.asset(AssetsConstants.feo),
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
                      AssetsConstants.person2_img,
                    ),
                  ),
                  Positioned(
                    top: 10.h,
                    left: 0.h,
                    child: Image.asset(
                      AssetsConstants.person1_img,
                    ),
                  ),
                  Positioned(
                    bottom: -120.h,
                    left: -50.h,
                    child: Image.asset(
                      AssetsConstants.rectangle3,
                    ),
                  ),
                  Positioned(
                    bottom: -120.h,
                    right: -140.h,
                    child: Image.asset(
                      AssetsConstants.rectangle5,
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
