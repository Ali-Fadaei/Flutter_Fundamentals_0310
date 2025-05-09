import 'package:bloc/bloc.dart';
import 'package:shop_cubit/domains/store/models/product.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  //
  FavoritesCubit() : super(FavoritesState.init());

  void onFavoriteButtonTapped(Product data) {
    //
    final favTemp = [...state.favorites];
    final dataIndex = favTemp.indexOf(data);
    if (dataIndex == -1) {
      favTemp.add(data);
    } else {
      favTemp.remove(data);
    }
    emit(state.copyWith(favorites: favTemp));
  }
}
