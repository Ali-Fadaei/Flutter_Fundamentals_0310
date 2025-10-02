part of 'favorites_cubit.dart';

enum FavoriteContentStatus {
  empty,
  filled,
  error,
}

final class FavoritesState {
  //
  final bool loading;

  final FavoriteContentStatus contentStatus;

  final List<Product> favorites;

  const FavoritesState({
    required this.loading,
    required this.favorites,
    required this.contentStatus,
  });

  const FavoritesState.init()
      : loading = false,
        contentStatus = FavoriteContentStatus.empty,
        favorites = const [];

  FavoritesState copyWith({
    bool? loading,
    List<Product>? favorites,
    FavoriteContentStatus? contentStatus,
  }) {
    return FavoritesState(
      loading: loading ?? this.loading,
      contentStatus: contentStatus ?? this.contentStatus,
      favorites: favorites ?? this.favorites,
    );
  }
}
