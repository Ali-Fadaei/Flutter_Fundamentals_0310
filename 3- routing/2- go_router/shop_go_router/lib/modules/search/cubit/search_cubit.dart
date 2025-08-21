import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shop_go_router/domains/store/models/product.dart';
import 'package:shop_go_router/domains/store/store_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  //
  final StoreRepository _storeRepo;

  final searchCtrl = TextEditingController();

  SearchCubit({
    required String searchTitle,
    required StoreRepository storeRepo,
  })  : _storeRepo = storeRepo,
        super(SearchState.init()) {
    onInit(searchTitle);
  }

  //=============================Functions=====================================
  Future<void> searchProducts() async {
    final res = await _storeRepo.getProducts(
      title: searchCtrl.text == '' ? null : searchCtrl.text,
    );
    emit(state.copyWith(
      products: res,
      isSearched: searchCtrl.text.isNotEmpty,
    ));
  }

  //==============================Events=======================================
  void onInit(String searchTitle) async {
    emit(state.copyWith(loading: true));
    searchCtrl.text = searchTitle;
    await searchProducts();
    emit(state.copyWith(loading: false));
  }

  void onSearched() async {
    emit(state.copyWith(loading: true));
    await searchProducts();
    emit(state.copyWith(loading: false));
  }
}
