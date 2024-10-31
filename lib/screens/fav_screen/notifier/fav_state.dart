part of 'fav_notifier.dart';

@freezed
class FavState with _$FavState {
  const factory FavState.initial() = _Initial;
  const factory FavState.loading() = _Loading;
  const factory FavState.fetched(List<String> list) = _Fetched;
  const factory FavState.errorState(String errorMessage) = _ErrorState;
}
