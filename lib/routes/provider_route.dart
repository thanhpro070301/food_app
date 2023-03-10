import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/features/auth/view/auth_screen.dart';
import 'package:go_router/go_router.dart';
import '../common/common.dart';

import '../features/home/view/home_screen.dart';
import '../features/details/view/test.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final tabs = [
  const ScaffoldWithNavBarTabItem(
    initialLocation: 'home',
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  const ScaffoldWithNavBarTabItem(
    initialLocation: 'product',
    icon: Icon(Icons.settings),
    label: 'Product',
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
          builder: (context, state) => const HomeScreen(),
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
                    GoRoute(
                      path: 'home',
                      pageBuilder: (context, state) => NoTransitionPage(
                        key: state.pageKey,
                        child: const HomeScreen(),
                      ),
                    ),
                    GoRoute(
                      path: 'product',
                      pageBuilder: (context, state) => NoTransitionPage(
                        key: state.pageKey,
                        child: const TestScreen(),
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
