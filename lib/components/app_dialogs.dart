import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_utility/configs/configs.dart';

class AppDialogs {
  static Future<dynamic> permissionFailDialog(
    BuildContext context, {
    VoidCallback? onResetTap,
  }) async =>
      showGeneralDialog(
        context: context,
        pageBuilder: (
          BuildContext buildContext,
          Animation animation,
          Animation secondaryAnimation,
        ) {
          return CupertinoTheme(
            data: CupertinoThemeData(
                brightness: Theme.of(context).brightness,
                barBackgroundColor: CupertinoColors.darkBackgroundGray),
            child: CupertinoAlertDialog(
              title: const Text(
                AppTexts.allow,
              ),
              content: const Text(AppTexts.allowMsg),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    AppTexts.dontAllow,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    onResetTap?.call();
                  },
                  child: const Text(
                    AppTexts.settings,
                    style: TextStyle(
                        color: CupertinoColors.systemBlue,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          );
        },
      );
  static Future<dynamic> showDialog(
    BuildContext context, {
    required String title,
    required String message,
    required String rightButtonText,
    TextStyle? rightButtonTextStyle,
    VoidCallback? rightButtonTap,
  }) async =>
      _showDialog(context,
          title: title,
          message: message,
          rightButtonText: rightButtonText,
          rightButtonTextStyle: rightButtonTextStyle,
          rightButtonTap: rightButtonTap);

  static Future<dynamic> _showDialog(
    BuildContext context, {
    required String title,
    required String message,
    required String rightButtonText,
    TextStyle? rightButtonTextStyle,
    VoidCallback? rightButtonTap,
  }) async =>
      showGeneralDialog(
        context: context,
        pageBuilder: (
          BuildContext buildContext,
          Animation animation,
          Animation secondaryAnimation,
        ) {
          return CupertinoTheme(
            data: CupertinoThemeData(
                brightness: Theme.of(context).brightness,
                barBackgroundColor: CupertinoColors.darkBackgroundGray),
            child: CupertinoAlertDialog(
              title: Text(title),
              content: Text(message),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    AppTexts.cancel,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    rightButtonTap?.call();
                  },
                  child: Text(
                    rightButtonText,
                    style: rightButtonTextStyle ??
                        const TextStyle(color: CupertinoColors.systemRed),
                  ),
                ),
              ],
            ),
          );
        },
      );
  static Future<dynamic> error(BuildContext context,
          {String? errorMessage}) async =>
      showGeneralDialog(
        context: context,
        barrierColor: AppColors.textPrimary.withOpacity(0.9),
        pageBuilder: (
          BuildContext buildContext,
          Animation animation,
          Animation secondaryAnimation,
        ) {
          return CupertinoTheme(
            data: CupertinoThemeData(
                brightness: Theme.of(context).brightness,
                barBackgroundColor: CupertinoColors.darkBackgroundGray),
            child: CupertinoAlertDialog(
              title: const Text(
                AppTexts.sww,
              ),
              content: Text(errorMessage ?? AppTexts.sww),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          );
        },
      );
}
