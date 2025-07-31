part of 'category_cubit.dart';

@immutable
class CategoryState {
  //
  final bool loading;
  final List<Product> products;
  final CategoryData? category;
  const CategoryState(
      {required this.loading, required this.category, required this.products});

  CategoryState.init()
      : category = null,
        products = [],
        loading = false;

  CategoryState copyWith(
      {CategoryData? category, bool? loading, List<Product>? products}) {
    return CategoryState(
        loading: loading ?? this.loading,
        category: category ?? this.category,
        products: products ?? this.products);
  }
}
