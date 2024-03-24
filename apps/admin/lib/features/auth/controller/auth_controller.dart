import 'package:admin/features/auth/repository/auth_repository.dart';
import 'package:admin/models/player_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<AuthController> authControllerProvider = Provider((ref) {
  var repository = ref.read(authRepositoryProvider);
  return AuthController(repository: repository);
});

class AuthController {
  final AuthRepository repository;
  AuthController({required this.repository});

  Future clickRegister(Player player, BuildContext context) async {
    return repository.clickRegister(player, context);
  }

   verifyOtp(String otp) async {
    return repository.verifyOtp(otp);
  }
}
