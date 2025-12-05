import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import './ui_kit.dart' as U;
import '/tool_kit/tool_kit.dart' as T;

class PinInput extends StatelessWidget {
  //
  final bool loading;

  final TextEditingController controller;

  final Function() onCompleted;

  const PinInput({
    super.key,
    this.loading = false,
    required this.controller,
    required this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    //
    final defaultTheme = PinTheme(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: U.Theme.surface,
        border: Border.all(width: 2, color: U.Theme.primary),
        borderRadius: BorderRadius.circular(U.Theme.r15),
      ),
      textStyle: TextStyle(
        fontSize: 18,
        color: U.Theme.onSurface,
        fontFamily: 'IranSans',
      ),
    );

    final focusedTheme = defaultTheme.copyBorderWith(
      border: Border.all(width: 2.5, color: U.Theme.primary),
    );

    final followingTheme = defaultTheme.copyBorderWith(
      border: Border.all(color: U.Theme.outline2),
    );

    final disabledTheme = defaultTheme.copyBorderWith(
      border: Border.all(width: 2, color: U.Theme.outline),
    );

    final cursor = Container(
      width: 2,
      height: 24,
      decoration: BoxDecoration(
        color: U.Theme.primary,
        borderRadius: BorderRadius.circular(2),
      ),
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        length: 5,
        controller: controller,
        enabled: !loading,
        pinAnimationType: PinAnimationType.scale,
        keyboardType: TextInputType.number,
        inputFormatters: [T.Formatters.pinCode],
        defaultPinTheme: defaultTheme,
        followingPinTheme: followingTheme,
        disabledPinTheme: disabledTheme,
        focusedPinTheme: focusedTheme,
        cursor: cursor,
        onCompleted: (_) => onCompleted(),
        listenForMultipleSmsOnAndroid: true,
        androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
      ),
    );
  }
}
