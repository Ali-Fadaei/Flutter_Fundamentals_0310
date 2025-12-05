import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_auth/modules/auth/cubit/auth_cubit.dart';
import 'package:shop_app_auth/modules/auth/otp_register_page.dart';
import 'package:shop_app_auth/ui_kit/ui_kit.dart' as U;

class OtpConfirmPage extends StatelessWidget {
  //
  static const route = 'confirm';

  const OtpConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          previous.otpConfirmLoading != current.otpConfirmLoading,
      builder: (context, state) {
        return Container(
          color: U.Theme.surface,
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(flex: 2),
                  const U.Text(
                    'تایید کد یکبارمصرف',
                    size: U.TextSize.s18,
                    weight: U.TextWeight.bold,
                  ),
                  const Spacer(flex: 1),
                  U.IconButton(
                    icon: U.Image.icon(path: U.Icons.arrowLeft),
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                  ),
                ],
              ),
              const U.Divider.horizontal(space: 10),
              const Spacer(flex: 2),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    const U.Text(
                      'کد تایید ارسال شده به شماره موبایل',
                      size: U.TextSize.s14,
                      weight: U.TextWeight.medium,
                    ),
                    U.Text(
                      ' ${authCubit.phoneCtrl.text} ',
                      size: U.TextSize.s14,
                      weight: U.TextWeight.bold,
                    ),
                    const U.Text(
                      'را وارد نمایید.',
                      size: U.TextSize.s14,
                      weight: U.TextWeight.medium,
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              U.PinInput(
                controller: authCubit.otpCtrl,
                onCompleted: authCubit.onOtpConfirmed,
                loading: state.otpConfirmLoading,
              ),
              const Spacer(),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return Container(
                    height: 40,
                    alignment: Alignment.center,
                    child: state.timer != 0
                        ? U.Text(
                            '${state.timer} ثانیه مانده تا دریافت مجدد کد',
                            size: U.TextSize.s16,
                            weight: U.TextWeight.medium,
                          )
                        : U.OutlineButton(
                            title: 'ارسال مجدد',
                            color: U.ButtonColor.secondary,
                            size: U.ButtonSize.md,
                            loading: state.otpRequestLoading,
                            onPressed: () async {
                              await authCubit.onOtpRequested();
                            },
                          ),
                  );
                },
              ),
              const Spacer(),
              U.Button(
                title: 'تایید',
                loading: state.otpConfirmLoading,
                color: U.ButtonColor.primary,
                size: U.ButtonSize.lg,
                onPressed: () async {
                  await authCubit.onOtpConfirmed();
                  GoRouter.of(context).goNamed(OtpRegisterPage.route);
                },
              ),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }
}
