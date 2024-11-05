import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:affirmation_utility/components/app_bar_widget.dart';
import 'package:affirmation_utility/components/affirmation_image.dart';
import 'package:affirmation_utility/configs/app_colors.dart';
import 'package:affirmation_utility/configs/app_texts.dart';
import 'package:affirmation_utility/screens/details_screen/details_screen.dart';
import 'package:affirmation_utility/screens/fav_screen/notifier/fav_notifier.dart';
import 'package:affirmation_utility/screens/home_screen/home_screen.dart';
import 'package:affirmation_utility/screens/main_screen/main_screen.dart';
import 'package:affirmation_utility/shared/provider.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  late StateNotifierProvider<FavNotifier, FavState> _favScreenProvider;

  @override
  void initState() {
    _favScreenProvider = StateNotifierProvider<FavNotifier, FavState>(
      (ref) => FavNotifier(ref.watch(userRepositoryProvider))..fetchData(),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppBarWidget(
            title: AppTexts.yourFavorites,
          ),
          Expanded(
              child: Consumer(
                  builder: (context, ref, child) => ref
                      .watch(_favScreenProvider)
                      .when(
                        initial: () => Container(),
                        loading: () => const LoadingWidgetPage(),
                        errorState: (message) => RefreshIndicator(
                          onRefresh: () async {
                            ref.watch(_favScreenProvider.notifier).fetchData();
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
                                  message,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                          color: AppColors.textSecondary),
                                ),
                              ),
                            ),
                          ),
                        ),
                        fetched: (list) {
                          return RefreshIndicator(
                            key: MainScreen.of(context)?.favKey,
                            onRefresh: () async {
                              ref
                                  .watch(_favScreenProvider.notifier)
                                  .fetchData();
                            },
                            child: list.isNotEmpty
                                ? GridView.builder(
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
                                      return AffirmationImage(
                                          onTap: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailsScreen(
                                                            list[index],
                                                            links: list)))
                                                .whenComplete(() {
                                              ref
                                                  .watch(_favScreenProvider
                                                      .notifier)
                                                  .fetchData();
                                            });
                                          },
                                          link: list[index]);
                                    },
                                  )
                                : SingleChildScrollView(
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                3,
                                            bottom: 10,
                                            right: 16,
                                            left: 16),
                                        child: Text(
                                          "You haven't added any affirmations to your favorites yet. Go to the Home screen and pick the images you like.",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                  color:
                                                      AppColors.textSecondary),
                                        ),
                                      ),
                                    ),
                                  ),
                          );
                        },
                      )))
        ],
      ),
    );
  }
}
