import 'package:flutter/material.dart';
import 'package:wallpaper_utility/components/bottom.dart';
import 'package:wallpaper_utility/screens/fav_screen/fav_screen.dart';
import 'package:wallpaper_utility/screens/home_screen/home_screen.dart';
import 'package:wallpaper_utility/screens/settings_screen/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static MainScreenState? of(BuildContext context) =>
      context.findAncestorStateOfType<MainScreenState>();
  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  GlobalKey<RefreshIndicatorState> favKey = GlobalKey<RefreshIndicatorState>();
  GlobalKey<RefreshIndicatorState> homeKey = GlobalKey<RefreshIndicatorState>();

  ValueNotifier<int> selectedIndexNotifier = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndexNotifier,
      builder: (BuildContext context, int value, Widget? child) => Scaffold(
        body: IndexedStack(
          index: selectedIndexNotifier.value,
          children: const [HomeScreen(), FavScreen(), SettingsScreen()],
        ),
        bottomNavigationBar: AppBottomNavigationBar(
            selectedIndexNotifier: selectedIndexNotifier,
            onChange: (value) {
              if (selectedIndexNotifier.value != value) {
                selectedIndexNotifier.value = value;
                if (selectedIndexNotifier.value == 0) {
                  homeKey.currentState?.show();
                }
                if (selectedIndexNotifier.value == 1) {
                  favKey.currentState?.show();
                }
              }
            }),
      ),
    );
  }
}
