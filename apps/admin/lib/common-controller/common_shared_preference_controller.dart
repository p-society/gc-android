import 'package:admin/common-repository/shared_preference_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final  commonSharedPreferenceControllerProvider = Provider<CommonSharedPreferenceController>((ref) {
  final repository =
      ref.read(commonSharedPreferenceRepositoryProvider) as CommonSharedPreferenceRepository;
  return CommonSharedPreferenceController(
      commonSharedPreferenceRepository: repository);
});

class CommonSharedPreferenceController {
  final CommonSharedPreferenceRepository commonSharedPreferenceRepository;
  CommonSharedPreferenceController({
    required this.commonSharedPreferenceRepository,
  });

  void addStringData(String key, String value) {
    commonSharedPreferenceRepository.addStringData(key, value);
  }

  String? getStringData(String key) {
    String? data = commonSharedPreferenceRepository.getStringData(key);
    return data;
  }
}
