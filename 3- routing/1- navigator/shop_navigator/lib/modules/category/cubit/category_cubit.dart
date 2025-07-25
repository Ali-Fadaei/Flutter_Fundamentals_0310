import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  //
  CategoryCubit() : super(CategoryState.init());
}
