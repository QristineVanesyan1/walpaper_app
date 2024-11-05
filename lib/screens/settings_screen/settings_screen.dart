import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:affirmation_utility/components/app_bar_widget.dart';
import 'package:affirmation_utility/components/app_dialogs.dart';
import 'package:affirmation_utility/configs/app_colors.dart';
import 'package:affirmation_utility/configs/app_texts.dart';
import 'package:affirmation_utility/configs/assets.dart';
import 'package:affirmation_utility/screens/main_screen/main_screen.dart';
import 'package:affirmation_utility/screens/settings_screen/settings_notifier/settings_notifier.dart';
import 'package:affirmation_utility/screens/terms_of_use_screen/privacy_policy_screen.dart';
import 'package:affirmation_utility/screens/terms_of_use_screen/terms_of_use_screen.dart';
import 'package:affirmation_utility/shared/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _settingsNotifierProvider =
      StateNotifierProvider<SettingsNotifier, SettingsState>(
    (ref) => SettingsNotifier(ref.watch(userRepositoryProvider)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          ref.listen(
            _settingsNotifierProvider,
            (_, state) => state.mapOrNull(
              dataCleared: (value) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                    (Route<dynamic> route) => false);
                return null;
              },
            ),
          );

          return Column(
            children: [
              const AppBarWidget(
                title: AppTexts.settings,
              ),
              SingleChildScrollView(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  child: Column(children: [
                    SettingsOption(
                      title: AppTexts.notifications,
                      onTap: () {
                        ref
                            .read(_settingsNotifierProvider.notifier)
                            .openNotifications();
                      },
                    ),
                    const SizedBox(height: 6),
                    SettingsOption(
                      title: AppTexts.privacyPolicy,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PrivacyPolicyScreen()));
                      },
                    ),
                    const SizedBox(height: 6),
                    SettingsOption(
                      title: AppTexts.termOfUse,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const TermsOfUseScreen()));
                      },
                    ),
                    const SizedBox(height: 6),
                    SettingsOption(
                      title: AppTexts.rateUs,
                      onTap: () {
                        ref.read(_settingsNotifierProvider.notifier).rateUs();
                      },
                    ),
                    const SizedBox(height: 6),
                    SettingsOption(
                      title: AppTexts.shareThisApp,
                      onTap: () {
                        ref.read(_settingsNotifierProvider.notifier).shareApp();
                      },
                    ),
                    const SizedBox(height: 6),
                    SettingsOption(
                      title: AppTexts.clearData,
                      onTap: () {
                        AppDialogs.showDialog(context,
                            title: AppTexts.clearData,
                            message: AppTexts.clearDataMsg,
                            rightButtonText: AppTexts.clearData,
                            rightButtonTap: () {
                          ref
                              .read(_settingsNotifierProvider.notifier)
                              .clearAllData();
                        });
                      },
                    ),
                  ])),
            ],
          );
        },
      ),
    );
  }
}

class SettingsOption extends StatelessWidget {
  const SettingsOption(
      {super.key, required this.title, required this.onTap, this.color});
  final String title;
  final VoidCallback onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.layer2, width: 2),
            borderRadius: BorderRadius.circular(12.0),
            color: color ?? AppColors.layer1),
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
        child: Row(
          children: [
            Expanded(
                child: Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
            )),
            SvgPicture.asset(Assets.arrowRight)
          ],
        ),
      ),
    );
  }
}
