import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_auth/modules/auth/cubit/auth_cubit.dart';
import 'package:shop_app_auth/modules/store/store_page.dart';
import 'package:shop_app_auth/ui_kit/ui_kit.dart' as U;

class OtpRegisterPage extends StatelessWidget {
//
  static const route = 'register';

  const OtpRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Container(
          color: U.Theme.surface,
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(flex: 8),
                  const U.Text(
                    'ثبت‌نام',
                    size: U.TextSize.s16,
                    weight: U.TextWeight.bold,
                  ),
                  const Spacer(flex: 6),
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
                      'برای تکمیل ثبت‌نام با شماره موبایل',
                      size: U.TextSize.s12,
                      weight: U.TextWeight.medium,
                    ),
                    U.Text(
                      ' ${authCubit.phoneCtrl.text} ',
                      size: U.TextSize.s12,
                      weight: U.TextWeight.bold,
                    ),
                    const U.Text(
                      'فرم زیر را تکمیل نمایید.',
                      size: U.TextSize.s12,
                      weight: U.TextWeight.medium,
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              U.TextInput(
                title: 'نام',
                isRequired: true,
                disabled: state.otpRegisterLoading,
                controller: authCubit.nameCtrl,
              ),
              const Spacer(),
              U.TextInput(
                title: 'نام خانوادگی',
                isRequired: true,
                disabled: state.otpRegisterLoading,
                controller: authCubit.lastNameCtrl,
              ),
              const Spacer(),
              U.TextInput(
                title: 'ایمیل',
                isRequired: true,
                disabled: state.otpRegisterLoading,
                controller: authCubit.emailCtrl,
              ),
              const Spacer(),
              U.TextInput(
                title: 'آدرس ',
                isRequired: true,
                disabled: state.otpRegisterLoading,
                hint: 'استان، شهر، منطقه...',
                controller: authCubit.addressCtrl,
              ),
              const Spacer(flex: 2),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return U.Button(
                    title: 'تایید',
                    color: U.ButtonColor.primary,
                    loading: state.otpRegisterLoading,
                    size: U.ButtonSize.lg,
                    onPressed: () async {
                      await authCubit.onRegisterRequested();
                      GoRouter.of(context).goNamed(StorePage.route);
                    },
                  );
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
