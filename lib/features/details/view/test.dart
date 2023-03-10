import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home/provider/food_provider.dart';

class TestScreen extends ConsumerStatefulWidget {
  const TestScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<TestScreen> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(foodControllerProvider);
    final isLoading = ref.watch(isLoadingFoodProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(data[index].cateName),
                  subtitle: Text(data[index].foodName.toString()),
                );
              },
            ),
    );
  }
}
