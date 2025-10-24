part of 'search_cubit.dart';

class SearchState {
  //
  final bool loading;
  final List<Product> products;
  final bool filterLoading;
  final double minRate;
  final double maxRate;
  final int minPrice;
  final int maxPrice;
  final List<CategoryData> categories;
  final List<CategoryData> selectedCategories;
  final int sort;
  final int order;
  final bool isSearched;

  SearchState({
    required this.selectedCategories,
    required this.minRate,
    required this.maxRate,
    required this.minPrice,
    required this.maxPrice,
    required this.sort,
    required this.order,
    required this.filterLoading,
    required this.categories,
    required this.loading,
    required this.products,
    required this.isSearched,
  });

  const SearchState.init()
      : loading = false,
        isSearched = false,
        products = const [],
        minRate = 0,
        maxRate = 5,
        filterLoading = false,
        categories = const [],
        selectedCategories = const [],
        minPrice = 0,
        maxPrice = 500000000,
        sort = 1,
        order = 1;

  SearchState copyWith({
    bool? loading,
    bool? isSearched,
    List<Product>? products,
    bool? filterLoading,
    double? minRate,
    double? maxRate,
    int? minPrice,
    List<CategoryData>? categories,
    List<CategoryData>? selectedCategories,
    int? maxPrice,
    int? sort,
    int? order,
  }) {
    return SearchState(
      loading: loading ?? this.loading,
      filterLoading: filterLoading ?? this.filterLoading,
      isSearched: isSearched ?? this.isSearched,
      products: products ?? this.products,
      minRate: minRate ?? this.minRate,
      maxRate: maxRate ?? this.maxRate,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      sort: sort ?? this.sort,
      order: order ?? this.order,
      categories: categories ?? this.categories,
      selectedCategories: selectedCategories ?? this.selectedCategories,
    );
  }
}
