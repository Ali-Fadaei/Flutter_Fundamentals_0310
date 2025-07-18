import 'package:bloc/bloc.dart';
import '/domains/store/models/category.dart';
import '/domains/store/store_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  //
  final StoreRepository storeRepo;

  CategoryCubit({required this.storeRepo}) : super(CategoryState.init()) {
    onInit();
  }

  Future<void> onInit() async {
    emit(state.copyWith(loading: true));
    final res = await storeRepo.getCategories();
    emit(state.copyWith(loading: false, categories: res));
  }
}
