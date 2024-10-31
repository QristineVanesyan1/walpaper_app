part of 'details_notifier.dart';

@freezed
class DetailsState with _$DetailsState {
  const factory DetailsState.initial() = _Initial;
  const factory DetailsState.loading() = _Loading;
  const factory DetailsState.fetched(
      List<String> list, String selected, bool selectedIsFav) = _Fetched;
  const factory DetailsState.errorState(String errorMessage) = _ErrorState;
}
