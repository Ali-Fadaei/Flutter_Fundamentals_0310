import 'package:bloc/bloc.dart';
import 'package:shop_cubit/domains/store/models/category.dart';
import 'package:shop_cubit/domains/store/models/product.dart';
import 'package:shop_cubit/domains/store/models/shop_item.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  //
  AppCubit() : super(AppState.init());

  void onSelectedIndexChanged(int selectedIndex) {
    emit(state.copyWith(selectedIndex: selectedIndex));
  }
}
