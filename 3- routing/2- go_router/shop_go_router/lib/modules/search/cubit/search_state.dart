part of 'search_cubit.dart';

class SearchState {
  //
  final bool loading;

  final List<Product> products;

  final bool isSearched;

  const SearchState({
    required this.loading,
    required this.products,
    required this.isSearched,
  });

  const SearchState.init()
      : loading = false,
        isSearched = false,
        products = const [];

  SearchState copyWith({
    bool? loading,
    bool? isSearched,
    List<Product>? products,
  }) {
    return SearchState(
      loading: loading ?? this.loading,
      isSearched: isSearched ?? this.isSearched,
      products: products ?? this.products,
    );
  }
}
