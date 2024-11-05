part of 'image_picker_notifier.dart';

@freezed
class ImagePickerState with _$ImagePickerState {
  const factory ImagePickerState.initial() = _Initial;
  const factory ImagePickerState.loading() = _Loading;
  const factory ImagePickerState.imagePickedState(File file) =
      _ImagePickedState;
  const factory ImagePickerState.imagePickedError(String? message) =
      _ImagePickedErrorState;
}
