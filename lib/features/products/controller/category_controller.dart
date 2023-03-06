import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/model/cate_model/cate_model.dart';
import '../provider/category_provider.dart';

class CategoryNotifier extends StateNotifier<List<CateModel>> {
  final Ref _ref;
  CategoryNotifier({required Ref ref})
      : _ref = ref,
        super([]) {
    fetchCategory(ref: _ref);
  }

  void fetchCategory({required Ref ref}) async {
    await ref.watch(categoryRepositoryProvider).fetchCategory().then(
      (res) {
        res.fold(
          (failure) {
            log('Failed to fetch categories: ${failure.message}');
          },
          (categories) {
            state = categories;
            ref.watch(isLoadingCategoryProvider.notifier).state = false;
          },
        );
      },
    );
  }
}
