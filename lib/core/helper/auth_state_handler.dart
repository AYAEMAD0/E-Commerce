import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/custom_dialog.dart';
import '../theme/app_color.dart';
import '../theme/styles.dart';
import '../constants/app_strings.dart';

class AuthStateHandler {
  static BlocConsumer<S, T> handleAuthState<S extends StateStreamable<T>, T>({
    required Widget Function(BuildContext context, T state) builder,
    required void Function(BuildContext context, T state) onSuccess,
  }) {
    return BlocConsumer<S, T>(
      listener: (context, state) {
        if (state.toString().contains('Loading')) {
          CustomDialog.showLoading(
            context: context,
            text: AppStrings.loading,
            background: AppColor.whiteColor,
            style: TextStyles.font18BlackMedium,
          );
        } else if (state.toString().contains('Success')) {
          CustomDialog.hideLoading(context: context);
          onSuccess(context, state);
        } else if (state.toString().contains('Verify')) {
          CustomDialog.hideLoading(context: context);
          String message = AppStrings.emailVerifiedYet;
          try {
            final msgField = state as dynamic;
            if (msgField.message != null) {
              message = msgField.message;
            }
          } catch (_) {}
          CustomDialog.showMessage(
            context: context,
            background: AppColor.whiteColor,
            title: AppStrings.emailNotVerified,
            styleTitle: TextStyles.font21PrimaryBold,
            message: message,
            styleMessage: TextStyles.font18BlackMedium,
            posActionName: AppStrings.ok,
            stylePosActionName: TextStyles.font21PrimaryBold,
          );
        } else if (state.toString().contains('Failure') ||
            state.toString().contains('Error')) {
          CustomDialog.hideLoading(context: context);

          String message = AppStrings.error;
          try {
            final msgField = state as dynamic;
            if (msgField.message != null) {
              message = msgField.message;
            }
            if (message.startsWith('Exception:')) {
              message = message.replaceFirst('Exception:', '').trim();
            }
          } catch (_) {}
          CustomDialog.showMessage(
            context: context,
            background: AppColor.whiteColor,
            message: message,
            styleMessage: TextStyles.font18BlackMedium,
            title: AppStrings.error,
            styleTitle: TextStyles.font21PrimaryBold,
            posActionName: AppStrings.ok,
            stylePosActionName: TextStyles.font21PrimaryBold,
          );
        }
      },
      builder: builder,
    );
  }
}
