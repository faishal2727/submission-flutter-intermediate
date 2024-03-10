// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_story_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostStoryResponse _$PostStoryResponseFromJson(Map<String, dynamic> json) {
  return _PostStoryResponse.fromJson(json);
}

/// @nodoc
mixin _$PostStoryResponse {
  @JsonKey(name: 'error')
  bool? get error => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostStoryResponseCopyWith<PostStoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostStoryResponseCopyWith<$Res> {
  factory $PostStoryResponseCopyWith(
          PostStoryResponse value, $Res Function(PostStoryResponse) then) =
      _$PostStoryResponseCopyWithImpl<$Res, PostStoryResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'error') bool? error,
      @JsonKey(name: 'message') String? message});
}

/// @nodoc
class _$PostStoryResponseCopyWithImpl<$Res, $Val extends PostStoryResponse>
    implements $PostStoryResponseCopyWith<$Res> {
  _$PostStoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostStoryResponseImplCopyWith<$Res>
    implements $PostStoryResponseCopyWith<$Res> {
  factory _$$PostStoryResponseImplCopyWith(_$PostStoryResponseImpl value,
          $Res Function(_$PostStoryResponseImpl) then) =
      __$$PostStoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'error') bool? error,
      @JsonKey(name: 'message') String? message});
}

/// @nodoc
class __$$PostStoryResponseImplCopyWithImpl<$Res>
    extends _$PostStoryResponseCopyWithImpl<$Res, _$PostStoryResponseImpl>
    implements _$$PostStoryResponseImplCopyWith<$Res> {
  __$$PostStoryResponseImplCopyWithImpl(_$PostStoryResponseImpl _value,
      $Res Function(_$PostStoryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
  }) {
    return _then(_$PostStoryResponseImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostStoryResponseImpl
    with DiagnosticableTreeMixin
    implements _PostStoryResponse {
  const _$PostStoryResponseImpl(
      {@JsonKey(name: 'error') this.error,
      @JsonKey(name: 'message') this.message});

  factory _$PostStoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostStoryResponseImplFromJson(json);

  @override
  @JsonKey(name: 'error')
  final bool? error;
  @override
  @JsonKey(name: 'message')
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PostStoryResponse(error: $error, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PostStoryResponse'))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostStoryResponseImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostStoryResponseImplCopyWith<_$PostStoryResponseImpl> get copyWith =>
      __$$PostStoryResponseImplCopyWithImpl<_$PostStoryResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostStoryResponseImplToJson(
      this,
    );
  }
}

abstract class _PostStoryResponse implements PostStoryResponse {
  const factory _PostStoryResponse(
          {@JsonKey(name: 'error') final bool? error,
          @JsonKey(name: 'message') final String? message}) =
      _$PostStoryResponseImpl;

  factory _PostStoryResponse.fromJson(Map<String, dynamic> json) =
      _$PostStoryResponseImpl.fromJson;

  @override
  @JsonKey(name: 'error')
  bool? get error;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$PostStoryResponseImplCopyWith<_$PostStoryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
