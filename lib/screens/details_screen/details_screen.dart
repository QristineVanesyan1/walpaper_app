import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:affirmation_utility/components/app_dialogs.dart';
import 'package:affirmation_utility/components/affirmation_image.dart';
import 'package:affirmation_utility/configs/app_colors.dart';
import 'package:affirmation_utility/screens/details_screen/notifier/details_notifier.dart';
import 'package:affirmation_utility/screens/details_screen/widgets/toolbar_widget.dart';
import 'package:affirmation_utility/screens/home_screen/home_screen.dart';
import 'package:affirmation_utility/shared/provider.dart';
import 'dart:ui' as ui;

class DetailsScreen extends ConsumerStatefulWidget {
  const DetailsScreen(this.selectedLink, {super.key, required this.links});
  final List<String> links;
  final String selectedLink;

  @override
  ConsumerState<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {
  final GlobalKey ssKey = GlobalKey();
  late StateNotifierProvider<DetailsNotifier, DetailsState>
      _detailsScreenProvider;
  late PageController _pageController;
  final Duration _duration = const Duration(milliseconds: 500);
  final Curve _curve = Curves.linearToEaseOut;

  @override
  void initState() {
    _detailsScreenProvider =
        StateNotifierProvider<DetailsNotifier, DetailsState>(
      (ref) => DetailsNotifier(ref.watch(userRepositoryProvider))
        ..fetchData(widget.links, widget.selectedLink),
    );
    _pageController =
        PageController(initialPage: widget.links.indexOf(widget.selectedLink));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ref.watch(_detailsScreenProvider).when(
            initial: () => const SizedBox.shrink(),
            loading: () => const LoadingWidgetPage(),
            fetched: (List<String> links, String selected, bool selectedIsFav) {
              return Stack(
                children: [
                  Positioned.fill(
                      child: RepaintBoundary(
                    key: ssKey,
                    child: PageView.builder(onPageChanged: (v) {
                      ref.read(_detailsScreenProvider.notifier).setPageIndex(v);
                    }, itemBuilder: (BuildContext context, int index) {
                      return PageView.builder(
                        itemCount: links.length,
                        onPageChanged: (v) {
                          ref
                              .read(_detailsScreenProvider.notifier)
                              .setPageIndex(v);
                        },
                        controller: _pageController,
                        itemBuilder: (BuildContext context, int index) =>
                            AffirmationImage(
                          link: links[index],
                        ),
                      );
                    }),
                  )),
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ToolbarWidget(
                      key: ValueKey(ref
                          .read(_detailsScreenProvider.notifier)
                          .selectedLink),
                      onClose: () {
                        Navigator.of(context).pop();
                      },
                      onShare: () async {
                        RenderRepaintBoundary boundary = ssKey.currentContext
                            ?.findRenderObject() as RenderRepaintBoundary;
                        ui.Image image = await boundary.toImage(pixelRatio: 3);
                        ByteData? bytes = await image.toByteData(
                            format: ui.ImageByteFormat.png);
                        Uint8List memoryImageData = bytes!.buffer.asUint8List();
                        await ref
                            .read(_detailsScreenProvider.notifier)
                            .shareFile(selected, memoryImageData);
                      },
                      onLeft: links.indexOf(selected) == 0
                          ? null
                          : () {
                              _pageController.previousPage(
                                  duration: _duration, curve: _curve);
                            },
                      onRight: links.indexOf(selected) == links.length - 1
                          ? null
                          : () {
                              _pageController.nextPage(
                                  duration: _duration, curve: _curve);
                            },
                      onFav: () {
                        ref
                            .read(_detailsScreenProvider.notifier)
                            .setFavUnFav(selected);
                      },
                      isFav: selectedIsFav,
                    ),
                  ))
                ],
              );
            },
            errorState: (String errorMessage) {
              return RefreshIndicator(
                onRefresh: () async {
                  ref
                      .read(_detailsScreenProvider.notifier)
                      .fetchData(widget.links, widget.selectedLink);
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
            }));
  }
}
