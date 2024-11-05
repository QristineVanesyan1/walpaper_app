import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpaper_utility/configs/app_colors.dart';
import 'package:wallpaper_utility/configs/assets.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar(
      {required this.selectedIndexNotifier, this.onChange, super.key});

  final ValueNotifier<int> selectedIndexNotifier;
  final ValueChanged<int>? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.layer1,
      child: SafeArea(
        child: SizedBox(
          height: 76,
          child: Container(
            color: AppColors.layer3,
            padding: const EdgeInsets.only(top: 1),
            child: ValueListenableBuilder(
              valueListenable: selectedIndexNotifier,
              builder: (context, __, _) => BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                backgroundColor: AppColors.layer1,
                items: <BottomNavigationBarItem>[
                  _getBottomNavigationBarItem(Screens.home),
                  _getBottomNavigationBarItem(Screens.fav),
                  _getBottomNavigationBarItem(Screens.settings),
                ],
                currentIndex: selectedIndexNotifier.value,
                unselectedItemColor: AppColors.textSecondary,
                selectedItemColor: AppColors.accentPrimary1,
                unselectedFontSize: 14.0,
                onTap: onChange,
              ),
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _getBottomNavigationBarItem(Screens screen) {
    return BottomNavigationBarItem(
      activeIcon: SizedBox(
        height: 30,
        child: SvgPicture.asset(screen.getIcon(),
            colorFilter: const ColorFilter.mode(
                AppColors.accentPrimary1, BlendMode.srcIn)),
      ),
      icon: SizedBox(
        height: 30,
        child: SvgPicture.asset(screen.getIcon()),
      ),
      label: screen.getTitle(),
    );
  }
}

enum Screens {
  home,
  fav,
  settings;

  String getIcon() {
    switch (this) {
      case Screens.home:
        return Assets.home;
      case Screens.fav:
        return Assets.fav;

      case Screens.settings:
        return Assets.settings;
    }
  }

  String getTitle() {
    switch (this) {
      case Screens.home:
        return 'Home';
      case Screens.fav:
        return 'Favorites';
      case Screens.settings:
        return 'Settings';
    }
  }
}
