part of 'search_cubit.dart';

class SearchState {
  //
  final bool loading;

  final List<Product> products;

  const SearchState({
    required this.loading,
    required this.products,
  });

  const SearchState.init()
      : loading = false,
        products = const [];

  SearchState copyWith({
    bool? loading,
    List<Product>? products,
  }) {
    return SearchState(
      loading: loading ?? this.loading,
      products: products ?? this.products,
    );
  }
}
