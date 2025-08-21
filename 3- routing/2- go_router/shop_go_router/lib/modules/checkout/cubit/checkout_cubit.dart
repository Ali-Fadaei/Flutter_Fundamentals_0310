import 'package:bloc/bloc.dart';
import 'package:shop_go_router/domains/store/models/shop_item.dart';
import 'package:shop_go_router/domains/store/store_repository.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  //
  final StoreRepository _storeRepo;

  CheckoutCubit({
    required StoreRepository storeRepo,
  })  : _storeRepo = storeRepo,
        super(CheckoutState.init()) {
    onInit();
  }

  //=============================Functions=====================================
  Future<void> searchProducts() async {}

  //==============================Events=======================================
  void onInit() async {}
}
