part of 'app_cubit.dart';

final class AppState {
  //
  final bool jwtAuth;

  const AppState({
    required this.jwtAuth,
  });

  const AppState.init({
    required this.jwtAuth,
  });

  bool get isAuth => jwtAuth;

  AppState copyWith({bool? jwtAuth}) {
    return AppState(
      jwtAuth: jwtAuth ?? this.jwtAuth,
    );
  }
}
