part of 'store_cubit.dart';

final class StoreState {
  //
  final List<Product> products;

  final List<CategoryData> categories;

  const StoreState({required this.products, required this.categories});

  const StoreState.init() : products = const [], categories = const [];

  StoreState copyWith({
    List<CategoryData>? categories,
    List<Product>? products,
  }) {
    return StoreState(
      products: products ?? this.products,
      categories: categories ?? this.categories,
    );
  }
}
