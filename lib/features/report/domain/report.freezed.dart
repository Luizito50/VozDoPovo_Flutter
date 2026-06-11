// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Report _$ReportFromJson(Map<String, dynamic> json) {
  return _Report.fromJson(json);
}

/// @nodoc
mixin _$Report {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  ReportCategory get category => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  LatLng get location => throw _privateConstructorUsedError;
  String get geohash => throw _privateConstructorUsedError;
  ReportStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get deviceHash => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;

  /// Serializes this Report to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportCopyWith<Report> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportCopyWith<$Res> {
  factory $ReportCopyWith(Report value, $Res Function(Report) then) =
      _$ReportCopyWithImpl<$Res, Report>;
  @useResult
  $Res call(
      {String id,
      String userId,
      ReportCategory category,
      String description,
      String photoUrl,
      LatLng location,
      String geohash,
      ReportStatus status,
      DateTime createdAt,
      String? deviceHash,
      String? address});
}

/// @nodoc
class _$ReportCopyWithImpl<$Res, $Val extends Report>
    implements $ReportCopyWith<$Res> {
  _$ReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? category = null,
    Object? description = null,
    Object? photoUrl = null,
    Object? location = null,
    Object? geohash = null,
    Object? status = null,
    Object? createdAt = null,
    Object? deviceHash = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ReportCategory,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng,
      geohash: null == geohash
          ? _value.geohash
          : geohash // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReportStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deviceHash: freezed == deviceHash
          ? _value.deviceHash
          : deviceHash // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportImplCopyWith<$Res> implements $ReportCopyWith<$Res> {
  factory _$$ReportImplCopyWith(
          _$ReportImpl value, $Res Function(_$ReportImpl) then) =
      __$$ReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      ReportCategory category,
      String description,
      String photoUrl,
      LatLng location,
      String geohash,
      ReportStatus status,
      DateTime createdAt,
      String? deviceHash,
      String? address});
}

/// @nodoc
class __$$ReportImplCopyWithImpl<$Res>
    extends _$ReportCopyWithImpl<$Res, _$ReportImpl>
    implements _$$ReportImplCopyWith<$Res> {
  __$$ReportImplCopyWithImpl(
      _$ReportImpl _value, $Res Function(_$ReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? category = null,
    Object? description = null,
    Object? photoUrl = null,
    Object? location = null,
    Object? geohash = null,
    Object? status = null,
    Object? createdAt = null,
    Object? deviceHash = freezed,
    Object? address = freezed,
  }) {
    return _then(_$ReportImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ReportCategory,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng,
      geohash: null == geohash
          ? _value.geohash
          : geohash // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReportStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deviceHash: freezed == deviceHash
          ? _value.deviceHash
          : deviceHash // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportImpl extends _Report {
  const _$ReportImpl(
      {required this.id,
      required this.userId,
      required this.category,
      required this.description,
      required this.photoUrl,
      required this.location,
      required this.geohash,
      this.status = ReportStatus.pending,
      required this.createdAt,
      this.deviceHash,
      this.address})
      : super._();

  factory _$ReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final ReportCategory category;
  @override
  final String description;
  @override
  final String photoUrl;
  @override
  final LatLng location;
  @override
  final String geohash;
  @override
  @JsonKey()
  final ReportStatus status;
  @override
  final DateTime createdAt;
  @override
  final String? deviceHash;
  @override
  final String? address;

  @override
  String toString() {
    return 'Report(id: $id, userId: $userId, category: $category, description: $description, photoUrl: $photoUrl, location: $location, geohash: $geohash, status: $status, createdAt: $createdAt, deviceHash: $deviceHash, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.geohash, geohash) || other.geohash == geohash) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.deviceHash, deviceHash) ||
                other.deviceHash == deviceHash) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      category,
      description,
      photoUrl,
      location,
      geohash,
      status,
      createdAt,
      deviceHash,
      address);

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportImplCopyWith<_$ReportImpl> get copyWith =>
      __$$ReportImplCopyWithImpl<_$ReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportImplToJson(
      this,
    );
  }
}

abstract class _Report extends Report {
  const factory _Report(
      {required final String id,
      required final String userId,
      required final ReportCategory category,
      required final String description,
      required final String photoUrl,
      required final LatLng location,
      required final String geohash,
      final ReportStatus status,
      required final DateTime createdAt,
      final String? deviceHash,
      final String? address}) = _$ReportImpl;
  const _Report._() : super._();

  factory _Report.fromJson(Map<String, dynamic> json) = _$ReportImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  ReportCategory get category;
  @override
  String get description;
  @override
  String get photoUrl;
  @override
  LatLng get location;
  @override
  String get geohash;
  @override
  ReportStatus get status;
  @override
  DateTime get createdAt;
  @override
  String? get deviceHash;
  @override
  String? get address;

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportImplCopyWith<_$ReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
