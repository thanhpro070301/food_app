import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/features/auth/auth_screen.dart';
import 'package:food_app/features/starteed/starteed_screen.dart';
import 'package:go_router/go_router.dart';

import '../features/home/home_screen.dart';
import '../features/product/product_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final tabs = [
  const ScaffoldWithNavBarTabItem(
    initialLocation: 'home',
    icon: Icon(Icons.home),
    label: 'Section A',
  ),
  const ScaffoldWithNavBarTabItem(
    initialLocation: 'product',
    icon: Icon(Icons.settings),
    label: 'Section B',
  ),
];
final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: '/',
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: "/",
          builder: (context, state) => const StarteedScreen(),
          routes: [
            GoRoute(
              path: "auth",
              builder: (context, state) => const AuthScreen(),
              routes: [
                ShellRoute(
                  navigatorKey: _shellNavigatorKey,
                  builder: (context, state, child) {
                    return ScaffoldWithBottomNavBar(tabs: tabs, child: child);
                  },
                  routes: [
                    // Products
                    GoRoute(
                      path: 'home',
                      pageBuilder: (context, state) => NoTransitionPage(
                        key: state.pageKey,
                        child: const HomeScreen(),
                      ),
                    ),
                    // Shopping Cart
                    GoRoute(
                      path: 'product',
                      pageBuilder: (context, state) => NoTransitionPage(
                        key: state.pageKey,
                        child: const ProductScreen(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
      ],
    );
  },
);

class ScaffoldWithNavBarTabItem extends BottomNavigationBarItem {
  const ScaffoldWithNavBarTabItem(
      {required this.initialLocation, required Widget icon, String? label})
      : super(icon: icon, label: label);

  final String initialLocation;
}

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar(
      {Key? key, required this.child, required this.tabs})
      : super(key: key);
  final Widget child;
  final List<ScaffoldWithNavBarTabItem> tabs;

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  int _locationToTabIndex(String location) {
    final index = widget.tabs
        .indexWhere((t) => location.startsWith("/auth/${t.initialLocation}"));
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  void _onItemTapped(BuildContext context, int tabIndex) {
    // Only navigate if the tab index has changed
    if (tabIndex != _currentIndex) {
      context.go('/auth/${widget.tabs[tabIndex].initialLocation}');
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
