import 'package:bloc/bloc.dart';
import 'package:shop_cubit/domains/store/models/product.dart';
import 'package:shop_cubit/domains/store/models/shop_item.dart';
import 'package:shop_cubit/domains/store/store_repository.dart';

part 'shop_cart_state.dart';

class ShopCartCubit extends Cubit<ShopCartState> {
  //
  final StoreRepository storeRepo;

  ShopCartCubit({required this.storeRepo}) : super(ShopCartState.init()) {
    onInit();
  }

  Future<void> onInit() async {
    emit(state.copyWith(loading: true));
    final res = await storeRepo.getShopItems();
    emit(state.copyWith(loading: false, shopItems: res));
  }

  Future<void> onRefresh() async {
    emit(state.copyWith(loading: true));
    final res = await storeRepo.getShopItems();
    emit(state.copyWith(loading: false, shopItems: res));
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
    storeRepo.updateShopItems(state.shopItems);
    final res = await storeRepo.getShopItems();
    emit(state.copyWith(loading: false, shopItems: res));
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
    storeRepo.updateShopItems(state.shopItems);
    final res = await storeRepo.getShopItems();
    emit(state.copyWith(loading: false, shopItems: res));
  }
}
