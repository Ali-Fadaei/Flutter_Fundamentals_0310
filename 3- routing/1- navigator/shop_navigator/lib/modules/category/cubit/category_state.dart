part of 'category_cubit.dart';

@immutable
 class CategoryState {
  //
  final bool loading;


  final CategoryData? category;

  final List<Product> Products;

  const CategoryState({
    required this.Products,
    required this.category,
    required this.loading,
  });

  const CategoryState.init(
    ): loading = false,Products = const [] ,category=null;
  //چون کتگوری مجبوره باشه پس ریکووارد

  CategoryState copywith({bool?loading,CategoryData? category, List<Product>? Products}){
    return CategoryState(
      loading: loading ?? this.loading,
      category: category ?? this.category,
      Products:  Products ?? this.Products,
    );
  }
 }