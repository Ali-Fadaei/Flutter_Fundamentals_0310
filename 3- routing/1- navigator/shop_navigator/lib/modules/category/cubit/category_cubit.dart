import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_navigator/domains/store/models/category.dart';
import 'package:shop_navigator/domains/store/models/product.dart';
import 'package:shop_navigator/domains/store/store_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  //
  final int id;//اگر هیچوقت قرار نیس تغییر کنه


  final StoreRepository _storeRepo;//private کردیم




  CategoryCubit({
    required StoreRepository storeRepo,
    required this.id,//چون یدونه پیج هست انواع اقسام کتگوری داره
  }) : _storeRepo=storeRepo,
  super(CategoryState.init()){
    onInit();
  }
  
  //_____________________________FUNCTION__________________________________________________________________________
  Future <void> getCategory()async{
    final res=await _storeRepo.getCategory(id: id);
    emit(state.copywith(category: res));
  }


  Future <void> getProducts() async{
   
   final res=await _storeRepo.getProducts(categoryId: id);
   emit(state.copywith(Products: res));
  }
  //____________________________EVENTS_____________________________________________________________________________
  void onInit()async{
emit(state.copywith(loading: true));
await Future.wait([getProducts(),getCategory()]);//اگر دوتا فانکشن که مستقل از هم باشند
emit(state.copywith(loading: false));
  }
  }
  //لودینگ ها بهتره در ایونت ها مدیریت کنیم
