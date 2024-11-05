// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_picker_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ImagePickerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(File file) imagePickedState,
    required TResult Function(String? message) imagePickedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(File file)? imagePickedState,
    TResult? Function(String? message)? imagePickedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(File file)? imagePickedState,
    TResult Function(String? message)? imagePickedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ImagePickedState value) imagePickedState,
    required TResult Function(_ImagePickedErrorState value) imagePickedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ImagePickedState value)? imagePickedState,
    TResult? Function(_ImagePickedErrorState value)? imagePickedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ImagePickedState value)? imagePickedState,
    TResult Function(_ImagePickedErrorState value)? imagePickedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagePickerStateCopyWith<$Res> {
  factory $ImagePickerStateCopyWith(
          ImagePickerState value, $Res Function(ImagePickerState) then) =
      _$ImagePickerStateCopyWithImpl<$Res, ImagePickerState>;
}

/// @nodoc
class _$ImagePickerStateCopyWithImpl<$Res, $Val extends ImagePickerState>
    implements $ImagePickerStateCopyWith<$Res> {
  _$ImagePickerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ImagePickerStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ImagePickerState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(File file) imagePickedState,
    required TResult Function(String? message) imagePickedError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(File file)? imagePickedState,
    TResult? Function(String? message)? imagePickedError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(File file)? imagePickedState,
    TResult Function(String? message)? imagePickedError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ImagePickedState value) imagePickedState,
    required TResult Function(_ImagePickedErrorState value) imagePickedError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ImagePickedState value)? imagePickedState,
    TResult? Function(_ImagePickedErrorState value)? imagePickedError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ImagePickedState value)? imagePickedState,
    TResult Function(_ImagePickedErrorState value)? imagePickedError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ImagePickerState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ImagePickerStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ImagePickerState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(File file) imagePickedState,
    required TResult Function(String? message) imagePickedError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(File file)? imagePickedState,
    TResult? Function(String? message)? imagePickedError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(File file)? imagePickedState,
    TResult Function(String? message)? imagePickedError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ImagePickedState value) imagePickedState,
    required TResult Function(_ImagePickedErrorState value) imagePickedError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ImagePickedState value)? imagePickedState,
    TResult? Function(_ImagePickedErrorState value)? imagePickedError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ImagePickedState value)? imagePickedState,
    TResult Function(_ImagePickedErrorState value)? imagePickedError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ImagePickerState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ImagePickedStateImplCopyWith<$Res> {
  factory _$$ImagePickedStateImplCopyWith(_$ImagePickedStateImpl value,
          $Res Function(_$ImagePickedStateImpl) then) =
      __$$ImagePickedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({File file});
}

/// @nodoc
class __$$ImagePickedStateImplCopyWithImpl<$Res>
    extends _$ImagePickerStateCopyWithImpl<$Res, _$ImagePickedStateImpl>
    implements _$$ImagePickedStateImplCopyWith<$Res> {
  __$$ImagePickedStateImplCopyWithImpl(_$ImagePickedStateImpl _value,
      $Res Function(_$ImagePickedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$ImagePickedStateImpl(
      null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$ImagePickedStateImpl implements _ImagePickedState {
  const _$ImagePickedStateImpl(this.file);

  @override
  final File file;

  @override
  String toString() {
    return 'ImagePickerState.imagePickedState(file: $file)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagePickedStateImpl &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagePickedStateImplCopyWith<_$ImagePickedStateImpl> get copyWith =>
      __$$ImagePickedStateImplCopyWithImpl<_$ImagePickedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(File file) imagePickedState,
    required TResult Function(String? message) imagePickedError,
  }) {
    return imagePickedState(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(File file)? imagePickedState,
    TResult? Function(String? message)? imagePickedError,
  }) {
    return imagePickedState?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(File file)? imagePickedState,
    TResult Function(String? message)? imagePickedError,
    required TResult orElse(),
  }) {
    if (imagePickedState != null) {
      return imagePickedState(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ImagePickedState value) imagePickedState,
    required TResult Function(_ImagePickedErrorState value) imagePickedError,
  }) {
    return imagePickedState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ImagePickedState value)? imagePickedState,
    TResult? Function(_ImagePickedErrorState value)? imagePickedError,
  }) {
    return imagePickedState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ImagePickedState value)? imagePickedState,
    TResult Function(_ImagePickedErrorState value)? imagePickedError,
    required TResult orElse(),
  }) {
    if (imagePickedState != null) {
      return imagePickedState(this);
    }
    return orElse();
  }
}

abstract class _ImagePickedState implements ImagePickerState {
  const factory _ImagePickedState(final File file) = _$ImagePickedStateImpl;

  File get file;
  @JsonKey(ignore: true)
  _$$ImagePickedStateImplCopyWith<_$ImagePickedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImagePickedErrorStateImplCopyWith<$Res> {
  factory _$$ImagePickedErrorStateImplCopyWith(
          _$ImagePickedErrorStateImpl value,
          $Res Function(_$ImagePickedErrorStateImpl) then) =
      __$$ImagePickedErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$ImagePickedErrorStateImplCopyWithImpl<$Res>
    extends _$ImagePickerStateCopyWithImpl<$Res, _$ImagePickedErrorStateImpl>
    implements _$$ImagePickedErrorStateImplCopyWith<$Res> {
  __$$ImagePickedErrorStateImplCopyWithImpl(_$ImagePickedErrorStateImpl _value,
      $Res Function(_$ImagePickedErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ImagePickedErrorStateImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ImagePickedErrorStateImpl implements _ImagePickedErrorState {
  const _$ImagePickedErrorStateImpl(this.message);

  @override
  final String? message;

  @override
  String toString() {
    return 'ImagePickerState.imagePickedError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagePickedErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagePickedErrorStateImplCopyWith<_$ImagePickedErrorStateImpl>
      get copyWith => __$$ImagePickedErrorStateImplCopyWithImpl<
          _$ImagePickedErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(File file) imagePickedState,
    required TResult Function(String? message) imagePickedError,
  }) {
    return imagePickedError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(File file)? imagePickedState,
    TResult? Function(String? message)? imagePickedError,
  }) {
    return imagePickedError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(File file)? imagePickedState,
    TResult Function(String? message)? imagePickedError,
    required TResult orElse(),
  }) {
    if (imagePickedError != null) {
      return imagePickedError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ImagePickedState value) imagePickedState,
    required TResult Function(_ImagePickedErrorState value) imagePickedError,
  }) {
    return imagePickedError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ImagePickedState value)? imagePickedState,
    TResult? Function(_ImagePickedErrorState value)? imagePickedError,
  }) {
    return imagePickedError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ImagePickedState value)? imagePickedState,
    TResult Function(_ImagePickedErrorState value)? imagePickedError,
    required TResult orElse(),
  }) {
    if (imagePickedError != null) {
      return imagePickedError(this);
    }
    return orElse();
  }
}

abstract class _ImagePickedErrorState implements ImagePickerState {
  const factory _ImagePickedErrorState(final String? message) =
      _$ImagePickedErrorStateImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$ImagePickedErrorStateImplCopyWith<_$ImagePickedErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
