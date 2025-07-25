import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:shop_navigator/domains/store/models/category.dart';
import 'package:shop_navigator/domains/store/models/product.dart';
import 'package:shop_navigator/domains/store/store_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  //
  final StoreRepository _storeRepo;

  CategoryCubit({
    required StoreRepository storeRepo,
    required CategoryData category,
  })  : _storeRepo = storeRepo,
        super(
          CategoryState.init(
            category: category,
          ),
        ) {
    onInit();
  }

//============================Functions=================================
  Future<void> getProducts() async {
    final res = await _storeRepo.getProducts(categoryId: state.category.id);
    emit(state.copyWith(products: res));
  }

//==============================Events==================================
  void onInit() async {
    emit(state.copyWith(loading: true));
    await getProducts();
    emit(state.copyWith(loading: false));
  }
}
