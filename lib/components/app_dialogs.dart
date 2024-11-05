import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_utility/configs/configs.dart';

class AppDialogs {
  static Future<void> showImagePickerDialog(
    BuildContext context, {
    required String title,
    required Widget bottom,
  }) async {
    showDialog(
        context: context,
        barrierColor: AppColors.layer2.withOpacity(0.9),
        barrierDismissible: false,
        builder: (context) => WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
                elevation: 0,
                backgroundColor: CupertinoColors.darkBackgroundGray,
                contentPadding: EdgeInsets.zero,
                insetPadding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 6),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.layer2),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(14.0))),
                content: SingleChildScrollView(
                    child: ListBody(children: <Widget>[
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      children: [
                        Text(title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  bottom,
                ])))));
  }

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
  static Future<dynamic> showDialog_(
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

class _AlertButtonBar extends StatelessWidget {
  const _AlertButtonBar({
    required this.selectExistingPlayer,
    required this.uploadFromGallery,
    required this.takeAPhoto,
    required this.cancel,
  });

  final VoidCallback selectExistingPlayer;
  final VoidCallback uploadFromGallery;
  final VoidCallback takeAPhoto;
  final VoidCallback cancel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ActionButton(
          title: AppTexts.uploadFromGallery,
          onTap: () {
            uploadFromGallery.call();
          },
          borderRadius: BorderRadius.circular(10),
        ),
        _ActionButton(
          title: AppTexts.takeAPhoto,
          onTap: () {
            takeAPhoto.call();
          },
          borderRadius: BorderRadius.circular(10),
        ),
        _ActionButton(
          title: AppTexts.cancel,
          onTap: () {
            cancel.call();
          },
          borderRadius: BorderRadius.circular(10),
        )
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton(
      {required this.title,
      required this.onTap,
      required this.borderRadius,
      this.fontWeight = FontWeight.w400});
  final String title;
  final VoidCallback onTap;
  final BorderRadius borderRadius;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          height: 1,
        ),
        InkWell(
            borderRadius: borderRadius,
            onTap: onTap,
            child: Align(
                alignment: Alignment.center,
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(title,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: CupertinoColors.activeBlue,
                            fontWeight: fontWeight))))),
      ],
    );
  }
}
