import 'package:bloc/bloc.dart';
import 'package:shop_go_router/domains/store/models/product.dart';
import 'package:shop_go_router/domains/store/store_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  //
  final StoreRepository _storeRepo;

  SearchCubit({
    required StoreRepository storeRepo,
  })  : _storeRepo = storeRepo,
        super(SearchState.init()) {
    onInit();
  }

  //=============================Functions=====================================
  Future<void> searchProducts() async {
    final res = await _storeRepo.getProducts();
    print(res);
    emit(state.copyWith(products: res));
  }

  //==============================Events=======================================
  void onInit() async {
    emit(state.copyWith(loading: true));
    await searchProducts();
    emit(state.copyWith(loading: false));
  }
}
