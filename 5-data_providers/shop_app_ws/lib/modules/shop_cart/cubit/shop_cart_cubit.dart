import 'dart:async';

import 'package:bloc/bloc.dart';
import '/domains/store/models/product.dart';
import '/domains/store/models/shop_item.dart';
import '/domains/store/store_repository.dart';

part 'shop_cart_state.dart';

class ShopCartCubit extends Cubit<ShopCartState> {
  //
  final StoreRepository storeRepo;

  Timer? updateTimer;

  ShopCartCubit({required this.storeRepo}) : super(ShopCartState.init()) {
    onInit();
  }

  //===============================Functions====================================
  Future<void> getShopItems() async {
    //
    try {
      final res = await storeRepo.readShopItems();
      emit(state.copyWith(
        shopItems: res,
        contentStatus: res.isEmpty
            ? ShopCartContentStatus.empty
            : ShopCartContentStatus.fill,
      ));
    } catch (e) {
      emit(state.copyWith(contentStatus: ShopCartContentStatus.error));
      rethrow;
    }
  }

  //=================================Events=====================================
  Future<void> onInit() async {
    try {
      emit(state.copyWith(loading: true));
      await getShopItems();
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> onRefresh({bool loading = false}) async {
    try {
      if (loading) emit(state.copyWith(loading: true));
      await getShopItems();
    } finally {
      if (loading) emit(state.copyWith(loading: false));
    }
  }

  Future<void> onRetry() async {
    try {
      emit(state.copyWith(loading: true));
      await getShopItems();
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  void onAddToShopCartPressed(Product data) async {
    //
    final shopItemsTemp = [...state.shopItems];

    final dataInex = shopItemsTemp.indexWhere((e) => e.product == data);
    if (dataInex == -1) {
      shopItemsTemp.add(ShopItem(product: data));
    } else {
      final temp = shopItemsTemp[dataInex];
      if (temp.count + 1 <= 10) {
        temp.count = temp.count + 1;
        shopItemsTemp.removeAt(dataInex);
        shopItemsTemp.insert(dataInex, temp);
      }
    }
    emit(state.copyWith(shopItems: shopItemsTemp));
    updateTimer?.cancel();
    updateTimer = Timer(const Duration(seconds: 1), () async {
      await storeRepo.updateShopItems(state.shopItems);
      await getShopItems();
    });
  }

  void onRemoveFromShopCartPressed(Product data) async {
    //
    final shopItemsTemp = [...state.shopItems];
    final temp = shopItemsTemp.firstWhere((element) => element.product == data);
    if (temp.count <= 1) {
      shopItemsTemp.remove(temp);
    } else {
      temp.count = temp.count - 1;
      final dataIndex = shopItemsTemp.indexWhere((e) => e.product == data);
      shopItemsTemp.removeAt(dataIndex);
      shopItemsTemp.insert(dataIndex, temp);
    }
    emit(state.copyWith(shopItems: shopItemsTemp));
    updateTimer?.cancel();
    updateTimer = Timer(const Duration(seconds: 1), () async {
      await storeRepo.updateShopItems(state.shopItems);
      await getShopItems();
    });
  }

  @override
  Future<void> close() {
    updateTimer?.cancel();
    return super.close();
  }
}
