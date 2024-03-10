// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_story_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListStoryResponse _$ListStoryResponseFromJson(Map<String, dynamic> json) {
  return _ListStoryResponse.fromJson(json);
}

/// @nodoc
mixin _$ListStoryResponse {
  @JsonKey(name: 'error')
  bool? get error => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'listStory')
  List<ListStory>? get listStory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListStoryResponseCopyWith<ListStoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListStoryResponseCopyWith<$Res> {
  factory $ListStoryResponseCopyWith(
          ListStoryResponse value, $Res Function(ListStoryResponse) then) =
      _$ListStoryResponseCopyWithImpl<$Res, ListStoryResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'error') bool? error,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'listStory') List<ListStory>? listStory});
}

/// @nodoc
class _$ListStoryResponseCopyWithImpl<$Res, $Val extends ListStoryResponse>
    implements $ListStoryResponseCopyWith<$Res> {
  _$ListStoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
    Object? listStory = freezed,
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
      listStory: freezed == listStory
          ? _value.listStory
          : listStory // ignore: cast_nullable_to_non_nullable
              as List<ListStory>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListStoryResponseImplCopyWith<$Res>
    implements $ListStoryResponseCopyWith<$Res> {
  factory _$$ListStoryResponseImplCopyWith(_$ListStoryResponseImpl value,
          $Res Function(_$ListStoryResponseImpl) then) =
      __$$ListStoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'error') bool? error,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'listStory') List<ListStory>? listStory});
}

/// @nodoc
class __$$ListStoryResponseImplCopyWithImpl<$Res>
    extends _$ListStoryResponseCopyWithImpl<$Res, _$ListStoryResponseImpl>
    implements _$$ListStoryResponseImplCopyWith<$Res> {
  __$$ListStoryResponseImplCopyWithImpl(_$ListStoryResponseImpl _value,
      $Res Function(_$ListStoryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
    Object? listStory = freezed,
  }) {
    return _then(_$ListStoryResponseImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      listStory: freezed == listStory
          ? _value._listStory
          : listStory // ignore: cast_nullable_to_non_nullable
              as List<ListStory>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListStoryResponseImpl
    with DiagnosticableTreeMixin
    implements _ListStoryResponse {
  const _$ListStoryResponseImpl(
      {@JsonKey(name: 'error') this.error,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'listStory') final List<ListStory>? listStory})
      : _listStory = listStory;

  factory _$ListStoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListStoryResponseImplFromJson(json);

  @override
  @JsonKey(name: 'error')
  final bool? error;
  @override
  @JsonKey(name: 'message')
  final String? message;
  final List<ListStory>? _listStory;
  @override
  @JsonKey(name: 'listStory')
  List<ListStory>? get listStory {
    final value = _listStory;
    if (value == null) return null;
    if (_listStory is EqualUnmodifiableListView) return _listStory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ListStoryResponse(error: $error, message: $message, listStory: $listStory)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ListStoryResponse'))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('listStory', listStory));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListStoryResponseImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._listStory, _listStory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message,
      const DeepCollectionEquality().hash(_listStory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListStoryResponseImplCopyWith<_$ListStoryResponseImpl> get copyWith =>
      __$$ListStoryResponseImplCopyWithImpl<_$ListStoryResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListStoryResponseImplToJson(
      this,
    );
  }
}

abstract class _ListStoryResponse implements ListStoryResponse {
  const factory _ListStoryResponse(
          {@JsonKey(name: 'error') final bool? error,
          @JsonKey(name: 'message') final String? message,
          @JsonKey(name: 'listStory') final List<ListStory>? listStory}) =
      _$ListStoryResponseImpl;

  factory _ListStoryResponse.fromJson(Map<String, dynamic> json) =
      _$ListStoryResponseImpl.fromJson;

  @override
  @JsonKey(name: 'error')
  bool? get error;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'listStory')
  List<ListStory>? get listStory;
  @override
  @JsonKey(ignore: true)
  _$$ListStoryResponseImplCopyWith<_$ListStoryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ListStory _$ListStoryFromJson(Map<String, dynamic> json) {
  return _ListStory.fromJson(json);
}

/// @nodoc
mixin _$ListStory {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'photoUrl')
  String? get photoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'lat')
  double? get lat => throw _privateConstructorUsedError;
  @JsonKey(name: 'lon')
  double? get lon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListStoryCopyWith<ListStory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListStoryCopyWith<$Res> {
  factory $ListStoryCopyWith(ListStory value, $Res Function(ListStory) then) =
      _$ListStoryCopyWithImpl<$Res, ListStory>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'photoUrl') String? photoUrl,
      @JsonKey(name: 'createdAt') String? createdAt,
      @JsonKey(name: 'lat') double? lat,
      @JsonKey(name: 'lon') double? lon});
}

/// @nodoc
class _$ListStoryCopyWithImpl<$Res, $Val extends ListStory>
    implements $ListStoryCopyWith<$Res> {
  _$ListStoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? photoUrl = freezed,
    Object? createdAt = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListStoryImplCopyWith<$Res>
    implements $ListStoryCopyWith<$Res> {
  factory _$$ListStoryImplCopyWith(
          _$ListStoryImpl value, $Res Function(_$ListStoryImpl) then) =
      __$$ListStoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'photoUrl') String? photoUrl,
      @JsonKey(name: 'createdAt') String? createdAt,
      @JsonKey(name: 'lat') double? lat,
      @JsonKey(name: 'lon') double? lon});
}

/// @nodoc
class __$$ListStoryImplCopyWithImpl<$Res>
    extends _$ListStoryCopyWithImpl<$Res, _$ListStoryImpl>
    implements _$$ListStoryImplCopyWith<$Res> {
  __$$ListStoryImplCopyWithImpl(
      _$ListStoryImpl _value, $Res Function(_$ListStoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? photoUrl = freezed,
    Object? createdAt = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_$ListStoryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListStoryImpl with DiagnosticableTreeMixin implements _ListStory {
  const _$ListStoryImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'photoUrl') this.photoUrl,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'lat') this.lat,
      @JsonKey(name: 'lon') this.lon});

  factory _$ListStoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListStoryImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'photoUrl')
  final String? photoUrl;
  @override
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @override
  @JsonKey(name: 'lat')
  final double? lat;
  @override
  @JsonKey(name: 'lon')
  final double? lon;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ListStory(id: $id, name: $name, description: $description, photoUrl: $photoUrl, createdAt: $createdAt, lat: $lat, lon: $lon)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ListStory'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('photoUrl', photoUrl))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('lat', lat))
      ..add(DiagnosticsProperty('lon', lon));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListStoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, photoUrl, createdAt, lat, lon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListStoryImplCopyWith<_$ListStoryImpl> get copyWith =>
      __$$ListStoryImplCopyWithImpl<_$ListStoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListStoryImplToJson(
      this,
    );
  }
}

abstract class _ListStory implements ListStory {
  const factory _ListStory(
      {@JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'photoUrl') final String? photoUrl,
      @JsonKey(name: 'createdAt') final String? createdAt,
      @JsonKey(name: 'lat') final double? lat,
      @JsonKey(name: 'lon') final double? lon}) = _$ListStoryImpl;

  factory _ListStory.fromJson(Map<String, dynamic> json) =
      _$ListStoryImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'photoUrl')
  String? get photoUrl;
  @override
  @JsonKey(name: 'createdAt')
  String? get createdAt;
  @override
  @JsonKey(name: 'lat')
  double? get lat;
  @override
  @JsonKey(name: 'lon')
  double? get lon;
  @override
  @JsonKey(ignore: true)
  _$$ListStoryImplCopyWith<_$ListStoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
