import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Provider CommonSharedPreferenceRepositoryProvider = Provider(
  (ref) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return CommonSharedPreferenceRepository(
      sharedPreferences: sharedPreferences,
    );
  },
);

class CommonSharedPreferenceRepository {
  final SharedPreferences sharedPreferences;
  CommonSharedPreferenceRepository({
    required this.sharedPreferences,
  });

  void addStringData(String key, String value) {
    sharedPreferences.setString(key, value);
  }

  String? getStringData(String key) {
    String? value = sharedPreferences.get(key) as String?;
    if (value != null) {
      return value;
    }
    return null;
  }
}
