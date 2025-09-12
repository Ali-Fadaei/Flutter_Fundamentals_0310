import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shop_go_router/domains/store/models/shop_item.dart';
import 'package:shop_go_router/domains/store/store_repository.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  //
  final StoreRepository _storeRepo;

  final addressCtrl = TextEditingController();

  final discountCtrl = TextEditingController();

  CheckoutCubit({
    required StoreRepository storeRepo,
  })  : _storeRepo = storeRepo,
        super(CheckoutState.init()) {
    onInit();
  }

  //=============================Functions=====================================
  Future<void> readShopItems() async {
    final res = await _storeRepo.getShopItems();
    emit(state.copyWith(shopItems: res));
  }

  //==============================Events=======================================
  void onInit() async {
    emit(state.copyWith(loading: true));
    await readShopItems();
    emit(state.copyWith(loading: false));
  }

  void onDiscountCheckPressed() async {
    emit(state.copyWith(discountLoading: true));
    final res = await _storeRepo.validateDiscountCode(discountCtrl.text);
    emit(state.copyWith(discountLoading: false, discountPercent: res));
  }

  void onOrderConfirmed() async {
    emit(state.copyWith(paymentLoading: true));
    final res = await _storeRepo.createOrder(addressCtrl.text);
    emit(state.copyWith(paymentLoading: false));
  }
}
