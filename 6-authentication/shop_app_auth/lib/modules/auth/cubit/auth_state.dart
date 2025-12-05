part of 'auth_cubit.dart';

class AuthState extends Equatable {
  //
  final bool otpRequestLoading;

  final bool otpConfirmLoading;

  final bool otpRegisterLoading;

  final int timer;

  const AuthState({
    required this.otpRequestLoading,
    required this.otpConfirmLoading,
    required this.otpRegisterLoading,
    required this.timer,
  });

  const AuthState.init()
      : otpRequestLoading = false,
        otpConfirmLoading = false,
        otpRegisterLoading = false,
        timer = 0;

  AuthState copyWith({
    bool? otpRequestLoading,
    bool? otpConfirmLoading,
    bool? otpRegisterLoading,
    int? timer,
  }) {
    return AuthState(
      otpRequestLoading: otpRequestLoading ?? this.otpRequestLoading,
      otpConfirmLoading: otpConfirmLoading ?? this.otpConfirmLoading,
      otpRegisterLoading: otpRegisterLoading ?? this.otpRegisterLoading,
      timer: timer ?? this.timer,
    );
  }

  @override
  List<Object> get props => [
        otpRequestLoading,
        otpConfirmLoading,
        otpRegisterLoading,
        timer,
      ];
}
