part of 'app_cubit.dart';

final class AppState {
  //
  final int themeId;

  final bool jwtAuth;

  const AppState({
    required this.themeId,
    required this.jwtAuth,
  });

  const AppState.init({
    required this.themeId,
    required this.jwtAuth,
  });

  bool get isAuth => jwtAuth;

  AppState copyWith({
    int? themeId,
    bool? jwtAuth,
  }) {
    return AppState(
      themeId: themeId ?? this.themeId,
      jwtAuth: jwtAuth ?? this.jwtAuth,
    );
  }
}
