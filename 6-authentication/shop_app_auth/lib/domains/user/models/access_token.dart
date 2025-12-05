import 'package:equatable/equatable.dart';

class AccessToken extends Equatable {
  //
  final String token;

  const AccessToken({required this.token});

  factory AccessToken.fromMap(Map map) {
    return AccessToken(token: map['token']);
  }

  toMap() {
    return {
      'token': token,
    };
  }

  @override
  List<Object?> get props => [token];
}
