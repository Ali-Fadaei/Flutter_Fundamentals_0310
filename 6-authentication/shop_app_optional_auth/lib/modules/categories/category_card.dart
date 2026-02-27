import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/modules/category/category_page.dart';
import '../../domains/store/models/category.dart';
import '/ui_kit/ui_kit.dart' as U;

class CategoryCard extends StatelessWidget {
  //
  final CategoryData data;

  final bool useGo;

  const CategoryCard({
    super.key,
    required this.data,
    this.useGo = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (useGo) {
          GoRouter.of(context).goNamed(
            CategoryPage.route,
            pathParameters: {
              'id': data.id.toString(),
            },
            extra: data,
          );
        } else {
          GoRouter.of(context).pushNamed(
            CategoryPage.route,
            pathParameters: {
              'id': data.id.toString(),
            },
            extra: data,
          );
        }
      },
      child: Hero(
        tag: 'category${data.id}',
        child: SizedBox(
          child: Container(
            height: 320,
            width: 200,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: data.color,
              borderRadius: BorderRadius.circular(U.Theme.r15),
            ),
            child: Column(
              children: [
                const Spacer(
                  flex: 8,
                ),
                Expanded(
                  flex: 80,
                  child: U.NetworkImage(
                    url: data.image,
                    // width: 150,
                    // height: 150,
                  ),
                ),
                const Spacer(
                  flex: 4,
                ),
                Text(
                  data.title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const Spacer(
                  flex: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
