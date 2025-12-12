import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shop_app_auth/domains/user/user_repository.dart';
import '/modules/app/router.dart';
import '/domains/store/store_repository.dart';
import '/modules/app/cubit/app_cubit.dart';

class App extends StatelessWidget {
  //
  static const name = 'Shop App';

  final UserRepository userRepo;

  final StoreRepository storeRepo;

  final AppCubit appCubit;

  const App({
    super.key,
    required this.userRepo,
    required this.storeRepo,
    required this.appCubit,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => userRepo,
        ),
        RepositoryProvider(
          create: (context) => storeRepo,
        ),
      ],
      child: BlocProvider.value(
        value: appCubit,
        child: OverlaySupport.global(
          child: BlocListener<AppCubit, AppState>(
            listenWhen: (previous, current) =>
                previous.isAuth != current.isAuth,
            listener: (context, state) {
              GoRouter.of(rootNavKey.currentState!.context).refresh();
            },
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.from(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
              ).copyWith(
                pageTransitionsTheme: const PageTransitionsTheme(
                  builders: {
                    TargetPlatform.windows: ZoomPageTransitionsBuilder(),
                    TargetPlatform.android: ZoomPageTransitionsBuilder(),
                    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
                  },
                ),
              ),
              localizationsDelegates: {
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
              },
              supportedLocales: [Locale('en', 'UK'), Locale('fa', 'IR')],
              builder: (context, child) {
                return MediaQuery.withNoTextScaling(child: child!);
              },
              locale: Locale('fa', 'IR'),
              scrollBehavior: const MaterialScrollBehavior().copyWith(
                physics: BouncingScrollPhysics(),
                dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.stylus,
                  PointerDeviceKind.touch,
                  PointerDeviceKind.trackpad,
                  PointerDeviceKind.invertedStylus,
                },
              ),
              routerConfig: router,
            ),
          ),
        ),
      ),
    );
  }
}
