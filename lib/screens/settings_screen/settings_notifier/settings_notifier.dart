import 'package:freezed_annotation/freezed_annotation.dart';

import 'dart:async';
import 'dart:ui';

import 'dart:io';
import 'package:app_settings/app_settings.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:riverpod/riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wallpaper_utility/configs/app_consts.dart';
import 'package:wallpaper_utility/repos/auth_repo.dart';

part 'settings_notifier.freezed.dart';
part 'settings_state.dart';

class SettingsNotifier extends StateNotifier<SettingsState> {
  SettingsNotifier(this._repository) : super(const SettingsState.initial());

  final UserRepository _repository;
  Timer? _debounce;
  void debounceProcess(VoidCallback onDebounce) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () async {
      onDebounce.call();
    });
  }

  Future<void> openNotifications() async {
    try {
      await AppSettings.openAppSettings(type: AppSettingsType.notification);
    } catch (e) {
      state = SettingsState.errorState(e.toString());
    }
  }

  Future<void> shareApp() async {
    debounceProcess(() async {
      try {
        String link =
            'https://play.google.com/store/apps/details?id=${AppConsts.appId}';
        if (Platform.isIOS) {
          link =
              'https://apps.apple.com/${AppConsts.appCountry}/app/${AppConsts.appName}/id${AppConsts.appAppleId}';
        }
        await Share.share(link);
      } catch (e) {
        state = SettingsState.errorState(e.toString());
      }
    });
  }

  Future<void> rateUs() async {
    try {
      final InAppReview inAppReview = InAppReview.instance;
      if (await inAppReview.isAvailable()) {
        if (Platform.isIOS) {
          await inAppReview.requestReview();
        } else {
          await inAppReview.openStoreListing();
        }
      }
    } catch (e) {
      state = SettingsState.errorState(e.toString());
    }
  }

  Future<void> clearAllData() async {
    state = const SettingsState.loading();
    await _repository.clearAllData();
    state = const SettingsState.dataCleared();
  }
}
