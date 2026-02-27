import 'package:equatable/equatable.dart';

class AccessToken extends Equatable {
  //
  final String token;

  final DateTime ttl;

  final DateTime ttr;

  const AccessToken({
    required this.token,
    required this.ttl,
    required this.ttr,
  });

  AccessToken.create({required this.token})
      : ttl = DateTime.now().add(const Duration(days: 7)),
        ttr = DateTime.now().add(const Duration(days: 5));

  factory AccessToken.fromMap(Map map) {
    return AccessToken(
      token: map['token'],
      ttl: DateTime.parse(map['ttl']),
      ttr: DateTime.parse(map['ttr']),
    );
  }

  toMap() {
    return {
      'token': token,
      'ttl': ttl.toIso8601String(),
      'ttr': ttr.toIso8601String(),
    };
  }

  bool get canUse {
    final res = !ttl.difference(DateTime.now()).isNegative;
    print('CanUse: $res');
    return res;
  }

  bool get shoulReferesh {
    final res = ttr.difference(DateTime.now()).isNegative;
    print('Should Refresh: $res');
    return res;
  }

  @override
  List<Object?> get props => [
        token,
        ttl,
        ttr,
      ];
}
