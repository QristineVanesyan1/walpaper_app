import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:image_picker/image_picker.dart';

part 'image_picker_notifier.freezed.dart';
part 'image_picker_state.dart';

class ImagePickerNotifier extends StateNotifier<ImagePickerState> {
  ImagePickerNotifier() : super(const ImagePickerState.initial());

  final ImagePicker _picker = ImagePicker();
  File? avatar;

  Future<void> onCameraTap() async {
    try {
      var file = await _setImage(ImageSource.camera);
      if (file != null) {
        state = ImagePickerState.imagePickedState(file);
      }
    } on PlatformException catch (e) {
      state = ImagePickerState.imagePickedError(e.message.toString());
    } catch (e) {
      state = ImagePickerState.imagePickedError(e.toString());
    }
  }

  Future<void> onGalleryTap() async {
    state = const ImagePickerState.loading();
    try {
      var file = await _setImage(ImageSource.gallery);
      if (file != null) {
        state = ImagePickerState.imagePickedState(file);
      }
    } on PlatformException catch (e) {
      state = ImagePickerState.imagePickedError(e.message.toString());
    } catch (e) {
      state = ImagePickerState.imagePickedError(e.toString());
    }
  }

  Future<File?> _setImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(
      requestFullMetadata: false,
      source: source,
      imageQuality: 10,
    );
    if (image != null) {
      avatar = File(image.path);
    }
    return avatar;
  }
}
