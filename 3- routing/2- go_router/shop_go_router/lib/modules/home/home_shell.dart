import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '/modules/app/cubit/app_cubit.dart';
import '/ui_kit/ui_kit.dart' as U;

class HomeShell extends StatelessWidget {
  //
  final StatefulNavigationShell child;

  const HomeShell({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    print('child.currentIndex');
    print(child.currentIndex);
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (previous, current) =>
          previous.selectedIndex != current.selectedIndex,
      builder: (context, appState) {
        final appCubit = BlocProvider.of<AppCubit>(context);
        return Scaffold(
          backgroundColor: U.Theme.background,
          drawer: Container(
            color: Colors.white,
            height: double.infinity,
            width: 200,
          ),
          bottomNavigationBar: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              return U.NavigationBar(
                selectedIndex: child.currentIndex,
                destinations: [
                  U.NavigationDestination(
                    title: 'دسته‌بندی',
                    icon: U.Icons.category,
                  ),
                  U.NavigationDestination(
                    title: 'سبدخرید',
                    badgeCount: state.shopItemsCount,
                    icon: U.Icons.shopCart,
                  ),
                  U.NavigationDestination(
                    title: 'فروشگاه',
                    icon: U.Icons.store,
                  ),
                  U.NavigationDestination(
                    title: 'علاقه‌مندی‌ها',
                    badgeCount: state.favsCount,
                    icon: U.Icons.favorites,
                  ),
                  U.NavigationDestination(
                    title: 'پروفایل',
                    icon: U.Icons.profile,
                  ),
                ],
                onDestinationChanged: child.goBranch,
              );
            },
          ),
          body: Column(
            children: [
              U.AppBar.primary(
                onMenuPressed: () {},
                onNotifPressed: () {},
              ),
              Expanded(
                child: child,
              ),
            ],
          ),
        );
        // );
      },
    );
  }
}
