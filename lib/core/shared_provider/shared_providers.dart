import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../network/dio_client.dart';
import '../../features/auth/data/repository/shared_preferences/helper.dart';
import '../../features/auth/data/repository/shared_preferences/preferences.dart';

final dioClientProvider = Provider<DioClient>((ref) {
  final Dio dio = Dio();
  return DioClient(dio: dio);
});

final preferencesProvider = Provider<Preference>((ref) {
  return Preference();
});

final sharedPrefHelperProvider = Provider<SharedPreferenceHelper>((ref) {
  return SharedPreferenceHelper(ref.read(preferencesProvider));
});
