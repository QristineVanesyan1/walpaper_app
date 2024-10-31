import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:wallpaper_utility/repos/auth_repo.dart';

part 'fav_notifier.freezed.dart';
part 'fav_state.dart';

class FavNotifier extends StateNotifier<FavState> {
  FavNotifier(this._repository) : super(const FavState.initial());
  final UserRepository _repository;

  Future<void> fetchData() async {
    state = const FavState.loading();
    List<String> favs = await _repository.getFavLinkList();
    state = FavState.fetched(favs);
  }
}
