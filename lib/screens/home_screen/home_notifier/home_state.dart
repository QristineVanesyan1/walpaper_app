part of 'home_notifier.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.fetched(List<String>? list, String selectedCategory) =
      _Fetched;
  const factory HomeState.errorState(String errorMessage) = _ErrorState;
  const factory HomeState.dataCleared() = _DataCleared;
}
