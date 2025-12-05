import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_app_auth/domains/user/user_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  //
  final UserRepository _userRepo;

  final phoneCtrl = TextEditingController();
  final otpCtrl = TextEditingController();

  String hashId = '';

  Timer? timer;

  //=================Registe Ctrls================
  final nameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final addressCtrl = TextEditingController();

  AuthCubit({required UserRepository userRepo})
      : _userRepo = userRepo,
        super(AuthState.init());

  Future<void> onOtpRequested() async {
    try {
      emit(state.copyWith(otpRequestLoading: true));
      final res = await _userRepo.otpGenerate(
        mobileNumber: phoneCtrl.text.replaceAll('-', ''),
      );
      hashId = res.id;
      timer?.cancel();
      emit(state.copyWith(timer: res.expireTime));
      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        emit(state.copyWith(timer: state.timer - 1));
        if (state.timer == 0) {
          timer?.cancel();
          timer = null;
        }
      });
    } finally {
      emit(state.copyWith(otpRequestLoading: false));
    }
  }

  Future<void> onOtpConfirmed() async {}

  Future<void> onRegisterRequested() async {}
}
