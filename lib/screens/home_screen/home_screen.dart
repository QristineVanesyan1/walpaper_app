import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallpaper_utility/components/app_bar_widget.dart';
import 'package:wallpaper_utility/components/app_loading.dart';
import 'package:wallpaper_utility/components/category_card_widget.dart';
import 'package:wallpaper_utility/components/wallpaper_image.dart';
import 'package:wallpaper_utility/configs/configs.dart';
import 'package:wallpaper_utility/screens/details_screen/details_screen.dart';
import 'package:wallpaper_utility/screens/home_screen/home_notifier/home_notifier.dart';
import 'package:wallpaper_utility/screens/main_screen/main_screen.dart';
import 'package:wallpaper_utility/shared/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeNotifierProvider = StateNotifierProvider<HomeNotifier, HomeState>(
    (ref) => HomeNotifier(ref.watch(userRepositoryProvider))..fetchData(null),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(),
      body: Column(
        children: [
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                return ref.watch(_homeNotifierProvider).when(initial: () {
                  return const CircularProgressIndicator();
                }, loading: () {
                  return const LoadingWidgetPage();
                }, fetched: (List<String>? list, String selectedCategory) {
                  return list == null
                      ? const SizedBox()
                      : Column(
                          children: [
                            AppBarWidget(
                              title: AppTexts.wallpaper,
                              child: ListView.separated(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return SizedBox(
                                      height: 50,
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: CategoryCardWidget(
                                            selected: selectedCategory ==
                                                AppConsts.categoriesList[index],
                                            title: Categories.getCategory(
                                                    AppConsts
                                                        .categoriesList[index])!
                                                .getTitle(),
                                            assetName: Categories.getCategory(
                                                    AppConsts
                                                        .categoriesList[index])!
                                                .getIcon(),
                                            onTap: () {
                                              ref
                                                  .watch(_homeNotifierProvider
                                                      .notifier)
                                                  .setCategory(AppConsts
                                                      .categoriesList[index]);
                                            },
                                          )),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(width: 8),
                                  itemCount: AppConsts.categoriesList.length),
                            ),
                            Expanded(
                              child: RefreshIndicator(
                                key: MainScreen.of(context)?.homeKey,
                                onRefresh: () async {
                                  ref
                                      .watch(_homeNotifierProvider.notifier)
                                      .fetchData(selectedCategory);
                                },
                                child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 1 / 2,
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 11.0,
                                    crossAxisSpacing: 11.0,
                                  ),
                                  padding: const EdgeInsets.all(16.0),
                                  itemCount: list.length,
                                  itemBuilder: (context, index) {
                                    return WallpaperImage(
                                        key: ValueKey(index),
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailsScreen(list[index],
                                                          links: list)));
                                        },
                                        link: list[index]);
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                }, errorState: (String errorMessage) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      ref.watch(_homeNotifierProvider.notifier).fetchData(null);
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: 10,
                              top: MediaQuery.of(context).size.height / 3,
                              right: 16,
                              left: 16),
                          child: Text(
                            errorMessage,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(color: AppColors.textSecondary),
                          ),
                        ),
                      ),
                    ),
                  );
                }, dataCleared: () {
                  return const Expanded(child: CircularProgressIndicator());
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

class LoadingWidgetPage extends StatelessWidget {
  const LoadingWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Spacer(
            flex: 5,
          ),
          LoadingWidget(),
          Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}

enum Categories {
  basketball,
  soccer,
  americanFootball;

  static Categories? getCategory(String cat) {
    switch (cat) {
      case "basketball":
        return Categories.basketball;
      case "football":
        return Categories.soccer;
      case "american_football":
        return Categories.americanFootball;
    }
    return null;
  }

  String getIcon() {
    switch (this) {
      case Categories.basketball:
        return Assets.basketball;
      case Categories.soccer:
        return Assets.soccer;
      case Categories.americanFootball:
        return Assets.football;
    }
  }

  String getTitle() {
    switch (this) {
      case Categories.basketball:
        return "Basketball";
      case Categories.soccer:
        return "Soccer";
      case Categories.americanFootball:
        return "American football";
    }
  }
}
