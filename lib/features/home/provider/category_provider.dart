import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/shared_provider/shared_providers.dart';
import '../controller/category_controller.dart';
import '../data/api/category_api.dart';
import '../data/model/cate_model/cate_model.dart';
import '../data/repository/category_repo.dart';

final categoryApiProvider = Provider<CategoryAPI>((ref) {
  final dioClient = ref.read(dioClientProvider);
  return CategoryAPI(dioClient: dioClient);
});

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  final categoryAPI = ref.read(categoryApiProvider);
  return CategoryRepository(categoryAPI: categoryAPI);
});

final isLoadingCategoryProvider = StateProvider<bool>((ref) {
  return true;
});

final categoryControllerProvider =
    StateNotifierProvider<CategoryNotifier, List<CateModel>>((ref) {
  return CategoryNotifier(ref: ref);
});
