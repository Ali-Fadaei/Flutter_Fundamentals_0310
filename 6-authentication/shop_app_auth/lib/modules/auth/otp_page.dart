import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_auth/modules/auth/cubit/auth_cubit.dart';
import 'package:shop_app_auth/modules/auth/otp_confirm_page.dart';
import 'package:shop_app_auth/ui_kit/ui_kit.dart' as U;
import 'package:shop_app_auth/tool_kit/tool_kit.dart' as T;

class OtpPage extends StatelessWidget {
  //
  static const route = '/auth/otp';

  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          previous.otpRequestLoading != current.otpRequestLoading,
      builder: (context, state) {
        return Container(
          color: U.Theme.surface,
          child: Column(
            children: [
              const U.Text(
                'ورود | ثبت‌نام',
                size: U.TextSize.s20,
                weight: U.TextWeight.bold,
              ),
              const U.Divider.horizontal(space: 10),
              const Spacer(flex: 2),
              const Row(
                children: [
                  U.Text(
                    'سلام!',
                    size: U.TextSize.s16,
                  ),
                  Spacer(),
                ],
              ),
              const Row(
                children: [
                  U.Text(
                    'برای ادامه شماره موبایل خود را وارد نمایید.',
                    size: U.TextSize.s14,
                  ),
                  Spacer(),
                ],
              ),
              const Spacer(),
              U.TextInput(
                title: 'شماره موبایل',
                autoFocus: true,
                disabled: false,
                controller: authCubit.phoneCtrl,
                formatters: [T.Formatters.mobileFormatter],
              ),
              const Spacer(flex: 2),
              U.Button(
                title: 'ادامه',
                color: U.ButtonColor.primary,
                loading: state.otpRequestLoading,
                size: U.ButtonSize.lg,
                onPressed: () async {
                  await authCubit.onOtpRequested();
                  GoRouter.of(context).goNamed(
                    OtpConfirmPage.route,
                    extra: state.hashCode,
                  );
                },
              ),
              const SizedBox(height: 10),
              const U.Text(
                'ورود شما به معنای پذیرش شرایط آمازون و قوانین حریم‌خصوصی است.',
                size: U.TextSize.s12,
              ),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }
}
