part of 'app_cubit.dart';

final class AppState {
  //
  final int selectedIndex;

  const AppState({required this.selectedIndex});

  const AppState.init() : selectedIndex = 2;

  AppState copyWith({
    int? selectedIndex,
    List<Product>? products,
    List<CategoryData>? categories,
    List<Product>? favorites,
    List<ShopItem>? shopItems,
  }) {
    return AppState(selectedIndex: selectedIndex ?? this.selectedIndex);
  }
}
