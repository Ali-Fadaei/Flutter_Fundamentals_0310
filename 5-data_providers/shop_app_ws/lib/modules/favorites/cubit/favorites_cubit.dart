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
    try {
      final res = await storeRepo.readFavorites();
      emit(state.copyWith(
        favorites: res,
        contentStatus: res.isEmpty
            ? FavoriteContentStatus.empty
            : FavoriteContentStatus.filled,
      ));
    } catch (e) {
      emit(state.copyWith(contentStatus: FavoriteContentStatus.error));
    }
  }

  //=============================Events=========================================
  Future<void> onInit() async {
    try {
      emit(state.copyWith(loading: true));
      await getFavorites();
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> onRefresh({bool loading = false}) async {
    try {
      if (loading) emit(state.copyWith(loading: true));
      await getFavorites();
    } finally {
      if (loading) emit(state.copyWith(loading: false));
    }
  }

  Future<void> onRetry() async {
    try {
      emit(state.copyWith(loading: true));
      await getFavorites();
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> onFavoriteButtonTapped(Product data) async {
    //
    final favTemp = [...state.favorites];
    final dataIndex = favTemp.indexOf(data);
    if (dataIndex == -1) {
      favTemp.add(data);
      await storeRepo.addFavorite(data);
      toast('به لیست علاقه مندی اضافه شد!');
    } else {
      favTemp.remove(data);
      await storeRepo.removeFavorite(data);
      toast('از لیست علاقه مندی حذف شد!');
    }

    emit(state.copyWith(favorites: favTemp));
    // storeRepo.updateFavorites(state.favorites);
    await getFavorites();
  }
}
