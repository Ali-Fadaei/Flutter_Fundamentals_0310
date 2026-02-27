import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '/domains/user/user_repository.dart';

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
    //add validation
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

  Future<bool> onOtpConfirmed() async {
    //add validation
    try {
      emit(state.copyWith(otpConfirmLoading: true));
      final res = _userRepo.otpConfirm(
        id: hashId,
        code: otpCtrl.text,
      );
      return res;
    } finally {
      emit(state.copyWith(otpConfirmLoading: false));
    }
  }

  Future<void> onRegisterRequested() async {
    try {
      emit(state.copyWith(otpRegisterLoading: true));
      await _userRepo.otpRegister(
        hashId: hashId,
        firstName: nameCtrl.text,
        lastName: lastNameCtrl.text,
        email: emailCtrl.text,
        address: addressCtrl.text,
      );
    } finally {
      emit(state.copyWith(otpRegisterLoading: false));
    }
  }
}
