import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/constants/theme_constants/theme.dart';
import 'package:food_app/routes/provider_route.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    return ScreenUtilInit(
      builder: (context, child) => MaterialApp.router(
        theme: theme(context),
        routerConfig: goRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
