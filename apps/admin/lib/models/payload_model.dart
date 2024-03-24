class PayLoad {
  final String iat;
  final String exp;
  final String aud;
  final String iss;
  final String sub;
  final String jti;

  PayLoad({
    required this.iat,
    required this.exp,
    required this.aud,
    required this.iss,
    required this.sub,
    required this.jti,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iat': iat,
      'exp': exp,
      'aud': aud,
      'iss': iss,
      'sub': sub,
      'jti': jti,
    };
  }

  factory PayLoad.fromMap(Map<String, dynamic> map) {
    return PayLoad(
      iat: map['iat'] as String,
      exp: map['exp'] as String,
      aud: map['aud'] as String,
      iss: map['iss'] as String,
      sub: map['sub'] as String,
      jti: map['jti'] as String,
    );
  }
}
