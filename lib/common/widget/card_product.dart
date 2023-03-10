import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/theme_constants/pallete.dart';

class CardProduct extends ConsumerWidget {
  final String categoryName;
  final String image;
  final String price;
  final VoidCallback onTap;

  const CardProduct({
    super.key,
    required this.categoryName,
    required this.image,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 321.h,
        width: 230.w,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 55.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40.h),
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Palette.whiteColor,
                          blurRadius: 2.h,
                          spreadRadius: 2.0,
                          offset: Offset(
                            2.h,
                            2.h,
                          ),
                        ),
                        BoxShadow(
                          color: Palette.whiteColor,
                          blurRadius: 3.h,
                          spreadRadius: 3.0,
                          offset: Offset(
                            3.h,
                            3.h,
                          ),
                        ),
                      ],
                    ),
                    height: 260.h,
                    width: 200.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 80.h,
                        ),
                        Text(categoryName),
                        Text("$price nghìn đồng"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 164.16.h,
                width: 164.16.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(90.h),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 192, 192, 192),
                      blurRadius: 2.h,
                      spreadRadius: 2.0,
                      offset: Offset(
                        2.h,
                        2.h,
                      ),
                    ),
                    BoxShadow(
                      color: const Color.fromARGB(255, 192, 192, 192),
                      blurRadius: 2.h,
                      spreadRadius: 2.0,
                      offset: Offset(
                        2.h,
                        3.h,
                      ),
                    ),
                    BoxShadow(
                      color: const Color.fromARGB(255, 192, 192, 192),
                      blurRadius: 5.h,
                      spreadRadius: 5.0,
                      offset: Offset(
                        2.h,
                        3.h,
                      ),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.h),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
