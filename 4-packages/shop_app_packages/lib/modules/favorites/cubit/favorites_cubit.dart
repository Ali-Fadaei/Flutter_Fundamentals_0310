import 'package:bloc/bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import '/domains/store/models/product.dart';
import '/domains/store/store_repository.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  //
  final StoreRepository storeRepo;

  FavoritesCubit({required this.storeRepo}) : super(FavoritesState.init()) {
    onInit();
  }

  //===========================Functions========================================
  Future<void> getFavorites() async {
    final res = await storeRepo.getFavorites();
    emit(state.copyWith(
      favorites: res,
      contentStatus: res.isEmpty
          ? FavoriteContentStatus.empty
          : FavoriteContentStatus.filled,
    ));
  }

  //=============================Events=========================================
  Future<void> onInit() async {
    emit(state.copyWith(loading: true));
    await getFavorites();
    emit(state.copyWith(loading: false));
  }

  Future<void> onRefresh() async {
    // emit(state.copyWith(loading: true));
    await getFavorites();
    // emit(state.copyWith(loading: false));
  }

  Future<void> onRetry() async {
    emit(state.copyWith(loading: true));
    await getFavorites();
    emit(state.copyWith(loading: false));
  }

  void onFavoriteButtonTapped(Product data) async {
    //
    emit(state.copyWith(loading: true));
    final favTemp = [...state.favorites];
    final dataIndex = favTemp.indexOf(data);
    if (dataIndex == -1) {
      favTemp.add(data);
      toast('به لیست علاقه مندی اضافه شد!');
    } else {
      favTemp.remove(data);
      toast('از لیست علاقه مندی حذف شد!');
    }

    emit(state.copyWith(favorites: favTemp));
    storeRepo.updateFavorites(state.favorites);
    await getFavorites();
    emit(state.copyWith(loading: false));
  }
}
