import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/theme_constants/pallete.dart';
import 'widget/line_tab.dart';

class TabCategory extends StatelessWidget {
  const TabCategory({
    super.key,
    required TabController? tabController,
    required this.myTabs,
  }) : _tabController = tabController;

  final TabController? _tabController;
  final List<Tab> myTabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      indicator: LineTabIndicator(
        color: Palette.backgroundOrange1,
        lineHeight: 1.5.h,
        strokeWidth: 3.h,
      ),
      labelColor: Palette.backgroundOrange1,
      unselectedLabelColor: const Color(0xffA8A8A8),
      controller: _tabController,
      labelStyle: const TextStyle(
        fontSize: 20,
      ),
      tabs: myTabs.map((e) => e).toList(),
    );
  }
}
