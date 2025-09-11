import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shop_go_router/domains/store/models/category.dart';
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

  Future<void> getCategories() async {
    final res = await _storeRepo.getCategories();
    emit(state.copyWith(categories: res, selectedCategories: res));
  }

  Future<void> searchProducts() async {
    List<int> tempIds = state.selectedCategories.map((e) => e.id).toList();
    final res = await _storeRepo.getProducts(
      title: searchCtrl.text == '' ? null : searchCtrl.text,
      categoryIds: tempIds.isEmpty ? null : tempIds,
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
    await getCategories();
    await searchProducts();
    emit(state.copyWith(
      loading: false,
    ));
  }

  void onRatingRangeChanged(double min, double max) {
    emit(state.copyWith(
      minRate: min,
      maxRate: max,
    ));
  }

  void onPriceRangeChanged(double min, double max) {
    emit(state.copyWith(
      minPrice: min.round(),
      maxPrice: max.round(),
    ));
  }

  void onCategoriesSelected({required CategoryData category}) {
    List<CategoryData> tempList = [...state.selectedCategories];
    if (tempList.contains(category)) {
      tempList.remove(category);
    } else {
      tempList.add(category);
    }
    if (tempList.isEmpty) {
      emit(state.copyWith(selectedCategories: state.categories));
    } else {
      emit(state.copyWith(selectedCategories: tempList));
    }
  }

  void onFiltersApplied() async {
    emit(state.copyWith(filterLoading: true));
    List<int> tempIds = state.selectedCategories.map((e) => e.id).toList();
    final res = await _storeRepo.getProducts(categoryIds: tempIds);
    emit(state.copyWith(products: res, filterLoading: false));
  }

  void onSortChanged(int value) {
    emit(state.copyWith(sort: value));
  }

  void onOrderChanged(int value) {
    emit(state.copyWith(order: value));
  }

  Future<bool> onSearched() async {
    emit(state.copyWith(filterLoading: true));
    await searchProducts();
    emit(state.copyWith(filterLoading: false));
    return true;
  }
}
