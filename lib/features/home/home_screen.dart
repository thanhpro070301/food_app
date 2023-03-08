import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/home/main_home_screen.dart';
import 'package:food_app/features/home/provider/category_provider.dart';
import '../../../common/loading_page.dart';
import '../../../common/widget/info_card.dart';
import '../../../core/constants/theme_constants/pallete.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> animation2;
  bool isSideMenu = true;
  bool isSideMenuClose = true;
  TabController? _tabController;
  List<Tab> myTabs = [];
  @override
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final categoriesProvider = ref.watch(categoryControllerProvider);
    if (categoriesProvider.isNotEmpty) {
      myTabs = categoriesProvider
          .map((category) => Tab(text: category.cateName))
          .toList();
      _tabController = TabController(vsync: this, length: myTabs.length);
    }
  }

  void openDrawer() {
    if (isSideMenuClose) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    setState(
      () {
        isSideMenuClose = !isSideMenuClose;
      },
    );
  }

  void closedDrawer() {
    if (!isSideMenuClose) {
      _animationController.reverse();
      setState(() {
        isSideMenuClose = true;
      });
    }
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 320))
      ..addListener(
        () {
          setState(() {});
        },
      );
    animation = Tween<double>(begin: 0.h, end: 1.h).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    animation2 = Tween<double>(begin: 1.h, end: 0.75.h).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoriesProvider = ref.watch(categoryControllerProvider);
    if (categoriesProvider.isEmpty) {
      return const Loader();
    }
    if (_tabController == null) {
      myTabs = categoriesProvider
          .map((category) => Tab(text: category.cateName))
          .toList();
      _tabController = TabController(vsync: this, length: myTabs.length);
    }
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  color: Palette.backgroundStartColor2,
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 320),
                curve: Curves.fastOutSlowIn,
                width: size.width,
                left: isSideMenuClose ? -500.h : 0,
                child: Container(
                  color: Palette.backgroundOrange1,
                  height: size.height,
                  child: Column(
                    children: [
                      SizedBox(height: 30.h),
                      const InfoCard(
                        text: "Security",
                        icon: CupertinoIcons.hurricane,
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: closedDrawer,
                child: Stack(
                  children: [
                    Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001.h)
                        ..rotateY(animation.value -
                            30.h * animation.value * pi / 280.h),
                      alignment: Alignment.center,
                      child: Transform.translate(
                        offset: Offset(animation.value * 255.h, 0),
                        child: Transform.scale(
                          scale: animation2.value,
                          child: ClipRRect(
                            borderRadius: isSideMenuClose
                                ? const BorderRadius.all(Radius.circular(0))
                                : BorderRadius.all(Radius.circular(50.h)),
                            child: ProductScreen(
                              onTap: openDrawer,
                              icon: isSideMenuClose
                                  ? CupertinoIcons.line_horizontal_3_decrease
                                  : CupertinoIcons.clear_thick_circled,
                            ),
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
      ),
    );
  }
}
