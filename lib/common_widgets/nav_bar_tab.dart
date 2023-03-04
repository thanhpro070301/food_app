import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBarTabItem extends BottomNavigationBarItem {
  final String initialLocation;
  const ScaffoldWithNavBarTabItem({
    required this.initialLocation,
    required Widget icon,
    String? label,
  }) : super(icon: icon, label: label);
}

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar({
    Key? key,
    required this.child,
    required this.tabs,
  }) : super(key: key);
  final Widget child;
  final List<ScaffoldWithNavBarTabItem> tabs;

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  int _locationToTabIndex(String location) {
    final index = widget.tabs.indexWhere(
      (t) => location.startsWith("/auth/${t.initialLocation}"),
    );
    return index < 0 ? 0 : index;
  }

  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      context.go(
        '/auth/${widget.tabs[tabIndex].initialLocation}',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: widget.tabs,
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }
}
