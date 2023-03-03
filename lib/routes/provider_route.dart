import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/features/auth/auth_screen.dart';
import 'package:food_app/features/home/home_screen.dart';
import 'package:food_app/features/starteed/starteed_screen.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      routes: [
        GoRoute(
          path: "/",
          builder: (BuildContext context, GoRouterState state) {
            return const StarteedScreen();
          },
          routes: [
            GoRoute(
              path: "auth",
              builder: (context, state) => const AuthScreen(),
              routes: [
                GoRoute(
                  path: "home",
                  builder: (context, state) => const HomeScreen(),
                )
              ],
            )
          ],
        ),
      ],
    );
  },
);
