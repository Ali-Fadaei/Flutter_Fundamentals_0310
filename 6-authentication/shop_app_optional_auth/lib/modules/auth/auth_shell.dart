import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/domains/user/user_repository.dart';
// import 'package:shop_app_auth/modules/auth/auth_otp_page.dart';
import '/modules/auth/cubit/auth_cubit.dart';
import '/modules/auth/otp_confirm_page.dart';
import '/modules/auth/otp_page.dart';
import '/ui_kit/ui_kit.dart' as U;

class AuthShell extends StatelessWidget {
//
  final Widget child;

  final String route;

  const AuthShell({
    super.key,
    required this.route,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return BlocProvider(
      create: (context) => AuthCubit(
        userRepo: RepositoryProvider.of<UserRepository>(context),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: U.Theme.background,
          body: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedAlign(
                duration: U.Theme.primaryDuration,
                alignment: orientation == Orientation.landscape
                    ? const Alignment(0.5, 0)
                    : const Alignment(0, -0.85),
                child: const SizedBox.square(
                  dimension: 150,
                  child: FittedBox(
                    child: U.Image(path: U.Images.logo),
                  ),
                ),
              ),
              AnimatedAlign(
                duration: U.Theme.primaryDuration,
                alignment: orientation == Orientation.landscape
                    ? const Alignment(-0.5, 0)
                    : const Alignment(0, 0.4),
                child: AnimatedContainer(
                  height: route.endsWith(OtpPage.route)
                      ? 280
                      : route.endsWith(OtpConfirmPage.route)
                          ? 330
                          : 450,
                  width: 340,
                  duration: U.Theme.primaryDuration,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: U.Theme.surface,
                    borderRadius: BorderRadius.circular(U.Theme.r15),
                    border: Border.all(color: U.Theme.outline),
                  ),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
