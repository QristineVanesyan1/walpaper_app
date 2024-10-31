part of 'settings_notifier.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _Initial;
  const factory SettingsState.loading() = _Loading;
  const factory SettingsState.errorState(String errorMessage) = _ErrorState;
  const factory SettingsState.dataCleared() = _DataCleared;
}
