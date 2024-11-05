import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:wallpaper_utility/configs/configs.dart';
import 'package:wallpaper_utility/repos/user_repo.dart';

part 'home_notifier.freezed.dart';
part 'home_state.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier(this._repository) : super(const HomeState.initial());

  final UserRepository _repository;

  String? _selectedCategory;
  List<String>? list;
  Future<void> setCategory(String category) async {
    _selectedCategory = category;
    await fetchData(category);
  }

  Future<void> fetchData(String? category) async {
    try {
      state = const HomeState.loading();
      if (category == null) {
        _selectedCategory = AppConsts.categoriesList.first;
      } else {
        _selectedCategory = category;
      }

      list = await _repository.getWallpapersByCategory(_selectedCategory!);
      state = HomeState.fetched(list, _selectedCategory!);
    } catch (e) {
      state = HomeState.errorState(e.toString());
    }
  }
}
