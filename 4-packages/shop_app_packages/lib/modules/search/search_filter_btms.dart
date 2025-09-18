import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '/modules/search/cubit/search_cubit.dart';
import '/ui_kit/ui_kit.dart' as U;

class SearchFilterBottomSheet extends StatelessWidget {
  //
  static void show(
    BuildContext context, {
    required SearchCubit searchCubit,
  }) {
    U.BottomSheet.show(
      context,
      maxHeight: 560,
      padding: EdgeInsets.zero,
      builder: (context) {
        return BlocProvider.value(
          value: searchCubit,
          child: SearchFilterBottomSheet(),
        );
      },
    );
  }

  const SearchFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final searchCubit = context.read<SearchCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  U.Image.icon(path: U.Icons.filter),
                  U.Text(
                    'jbv',
                    //'فیلتر محصولات ${state.category?.title ?? ''}',
                    size: U.TextSize.s18,
                  ),
                  const Spacer(),
                ],
              ),
            ),
            U.Divider.horizontal(
              thickness: 1,
              space: 24,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: U.Text(
                'براساس امتیاز',
                size: U.TextSize.s16,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: U.RangeSlider(
                minValue: 0,
                maxValue: 5,
                minRangeValue: state.minRate,
                maxRangeValue: state.maxRate,
                divisions: 10,
                showType: U.RangeSliderShowType.double,
                sign: Icon(
                  Icons.star,
                  size: 24,
                  color: Colors.amber,
                ),
                onChanged: searchCubit.onRatingRangeChanged,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: U.Text(
                'براساس قیمت',
                size: U.TextSize.s16,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: U.RangeSlider(
                minValue: 0,
                maxValue: 500000000,
                divisions: 5000,
                minRangeValue: state.minPrice.toDouble(),
                maxRangeValue: state.maxPrice.toDouble(),
                showType: U.RangeSliderShowType.int,
                sign: U.Text(
                  'تومان',
                ),
                onChanged: searchCubit.onPriceRangeChanged,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: U.Text(
                'به ترتیب',
                size: U.TextSize.s16,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  const Spacer(),
                  U.RadioButton(
                    title: 'قیمت',
                    value: 0,
                    groupValue: state.sort,
                    onPressed: searchCubit.onSortChanged,
                  ),
                  const Spacer(),
                  U.RadioButton(
                    title: 'امتیاز',
                    value: 1,
                    groupValue: state.sort,
                    onPressed: searchCubit.onSortChanged,
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 30,
                    child: U.Divider.vertical(
                      thickness: 2,
                      space: 12,
                    ),
                  ),
                  const Spacer(),
                  U.RadioButton(
                    title: 'صعودی',
                    value: 0,
                    groupValue: state.order,
                    onPressed: searchCubit.onOrderChanged,
                  ),
                  const Spacer(),
                  U.RadioButton(
                    title: 'نزولی',
                    value: 1,
                    groupValue: state.order,
                    onPressed: searchCubit.onOrderChanged,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 122,
              child: ListView.builder(
                  itemCount: state.categories.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  itemBuilder: (context, index) {
                    return U.CheckBox(
                        title: state.categories[index].title,
                        isChecked: state.selectedCategories
                            .any((e) => e.id == state.categories[index].id),
                        onPressed: () {
                          searchCubit.onCategoriesSelected(
                              category: state.categories[index]);
                        });
                  }),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: U.Button(
                title: 'اعمال فیلتر',
                loading: state.filterLoading,
                onPressed: () async {
                  final res = await searchCubit.onSearched();
                  if (res) GoRouter.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
