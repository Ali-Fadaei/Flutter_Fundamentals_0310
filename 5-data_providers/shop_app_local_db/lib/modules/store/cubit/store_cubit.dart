import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '/domains/store/models/category.dart';
import '/domains/store/models/product.dart';
import '/domains/store/store_repository.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  //
  final StoreRepository storeRepo;

  final int? initialProductId;

  final searchCtrl = TextEditingController();

  StoreCubit({
    required this.storeRepo,
    this.initialProductId,
  }) : super(StoreState.init()) {
    onInit();
  }

  Future<void> onInit() async {
    emit(state.copyWith(loading: true));
    final productRes = await storeRepo.readProducts();
    final categoriesRes = await storeRepo.readCategories();
    Product? initialProduct;
    if (initialProductId != null) {
      initialProduct = await storeRepo.readProduct(id: initialProductId!);
    }
    emit(
      state.copyWith(
        loading: false,
        products: productRes,
        categories: categoriesRes,
        initialProduct: initialProduct,
      ),
    );
  }
}
