part of 'favorites_cubit.dart';

final class FavoritesState {
  //
  final List<Product> favorites;

  const FavoritesState({required this.favorites});

  const FavoritesState.init() : favorites = const [];

  FavoritesState copyWith({List<Product>? favorites}) {
    return FavoritesState(favorites: favorites ?? this.favorites);
  }
}
