import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/widget/line_tab.dart';
import '../../../core/constants/theme_constants/theme.dart';

import '../../../gen/assets.gen.dart';
import 'signin/signin_screen.dart';
import 'signup/signup_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static route() => MaterialPageRoute(
        builder: (context) => const AuthScreen(),
      );
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  static List<Tab> myTabs = <Tab>[
    const Tab(
      text: "Sign In",
    ),
    const Tab(
      text: 'Sign Up',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Column(
          children: [
            _tabBar(),
            _tabBarView()
          ],
        ),
      ),
    );
  }


  Expanded _tabBarView() {
    return Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                SignInScreen(),
                SignUpScreen(),
              ],
            ),
          );
  }

  Container _tabBar() {
    return Container(
            height: 250.h,
            decoration: BoxDecoration(
              color: Palette.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 192, 192, 192),
                  blurRadius: 30.h,
                  spreadRadius: 10.0,
                  offset: Offset(
                    5.h,
                    5.h,
                  ),
                ),
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45.h),
                bottomRight: Radius.circular(45.h),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 150.w,
                  height: 150.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        Assets.images.hatImg.path,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                TabBar(
                  indicator: LineTabIndicator(
                    color: Palette.backgroundOrange1,
                    lineHeight: 1.5.h,
                    strokeWidth: 3.h,
                  ),
                  labelColor: Palette.backgroundOrange1,
                  unselectedLabelColor: const Color(0xffA8A8A8),
                  controller: _tabController,
                  labelStyle: TextStyle(
                    fontSize: 20.h,
                  ),
                  tabs: myTabs.map((e) => e).toList(),
                ),
              ],
            ),
          );
  }
}
