part of 'app_cubit.dart';

final class AppState {
  //
  final int selectedIndex;

  final List<Product> products;

  final List<CategoryData> categories;

  // final List<Product> favorites;

  final List<ShopItem> shopItems;

  const AppState({
    required this.selectedIndex,
    required this.products,
    required this.categories,
    // required this.favorites,
    required this.shopItems,
  });

  const AppState.init()
    : selectedIndex = 2,
      products = const [],
      categories = const [],
      // favorites = const [],
      shopItems = const [];

  AppState copyWith({
    int? selectedIndex,
    List<Product>? products,
    List<CategoryData>? categories,
    List<Product>? favorites,
    List<ShopItem>? shopItems,
  }) {
    return AppState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      products: products ?? this.products,
      categories: categories ?? this.categories,
      // favorites: favorites ?? this.favorites,
      shopItems: shopItems ?? this.shopItems,
    );
  }
}
