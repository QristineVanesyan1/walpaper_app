import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:affirmation_utility/repos/auth_repo.dart';

part 'details_notifier.freezed.dart';
part 'details_state.dart';

class DetailsNotifier extends StateNotifier<DetailsState> {
  DetailsNotifier(this._repository) : super(const DetailsState.initial());
  final UserRepository _repository;
  int currentPageIndex = 0;
  String? selectedLink;
  bool? selectedIsFav;
  List<String> links = [];
  List<String> favorites = [];
  Timer? _debounce;
  Future<void> setPageIndex(int index) async {
    selectedLink = links[index];
    currentPageIndex = index;
    selectedIsFav = favorites.contains(selectedLink);

    state =
        DetailsState.fetched(links, selectedLink ?? '', selectedIsFav ?? false);
  }

  Future<void> setFavUnFav(String link) async {
    selectedLink = link;
    currentPageIndex = links.indexOf(link);
    if (favorites.contains(link)) {
      await _repository.removeFavLink(link);
    } else {
      await _repository.addFavLink(link);
    }
    favorites = await _repository.getFavLinkList();
    selectedIsFav = favorites.contains(link);
    state =
        DetailsState.fetched(links, selectedLink ?? '', selectedIsFav ?? false);
  }

  Future<void> fetchData(List<String> links_, String selectedLink_) async {
    favorites = await _repository.getFavLinkList();
    links = links_;
    selectedLink = selectedLink_;
    currentPageIndex = links_.indexOf(selectedLink_);
    selectedIsFav = favorites.contains(selectedLink_);
    state =
        DetailsState.fetched(links, selectedLink ?? '', selectedIsFav ?? false);
  }

  Future<void> shareFile(String id, Uint8List memoryImageData) async {
    debounceProcess(() async {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/temp.png');
      await file.writeAsBytes(memoryImageData);
      await Share.shareXFiles([XFile('${directory.path}/temp.png')]);
    });
  }

  void debounceProcess(VoidCallback onDebounce) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () async {
      onDebounce.call();
    });
  }
}
