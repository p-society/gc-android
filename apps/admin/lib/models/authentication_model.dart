import 'package:admin/models/payload_model.dart';

class AuthenticationModel {
  final String strategy;
  final String accessToken;
  final PayLoad payLoad;

  AuthenticationModel(
      {required this.strategy,
      required this.accessToken,
      required this.payLoad});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'strategy': strategy,
      'accessToken': accessToken,
      'payLoad': payLoad.toMap(),
    };
  }

  factory AuthenticationModel.fromMap(Map<String, dynamic> map) {
    return AuthenticationModel(
      strategy: map['strategy'] as String,
      accessToken: map['accessToken'] as String,
      payLoad: PayLoad.fromMap(map['payLoad'] as Map<String, dynamic>),
    );
  }
}
