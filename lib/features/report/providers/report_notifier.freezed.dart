// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReportFormState {
  File? get photo => throw _privateConstructorUsedError;
  LatLng? get location => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  ReportCategory? get category => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of ReportFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportFormStateCopyWith<ReportFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportFormStateCopyWith<$Res> {
  factory $ReportFormStateCopyWith(
          ReportFormState value, $Res Function(ReportFormState) then) =
      _$ReportFormStateCopyWithImpl<$Res, ReportFormState>;
  @useResult
  $Res call(
      {File? photo,
      LatLng? location,
      String? address,
      ReportCategory? category,
      String description,
      bool isLoading,
      bool isSuccess,
      String? errorMessage});
}

/// @nodoc
class _$ReportFormStateCopyWithImpl<$Res, $Val extends ReportFormState>
    implements $ReportFormStateCopyWith<$Res> {
  _$ReportFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photo = freezed,
    Object? location = freezed,
    Object? address = freezed,
    Object? category = freezed,
    Object? description = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as File?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ReportCategory?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportFormStateImplCopyWith<$Res>
    implements $ReportFormStateCopyWith<$Res> {
  factory _$$ReportFormStateImplCopyWith(_$ReportFormStateImpl value,
          $Res Function(_$ReportFormStateImpl) then) =
      __$$ReportFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {File? photo,
      LatLng? location,
      String? address,
      ReportCategory? category,
      String description,
      bool isLoading,
      bool isSuccess,
      String? errorMessage});
}

/// @nodoc
class __$$ReportFormStateImplCopyWithImpl<$Res>
    extends _$ReportFormStateCopyWithImpl<$Res, _$ReportFormStateImpl>
    implements _$$ReportFormStateImplCopyWith<$Res> {
  __$$ReportFormStateImplCopyWithImpl(
      _$ReportFormStateImpl _value, $Res Function(_$ReportFormStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photo = freezed,
    Object? location = freezed,
    Object? address = freezed,
    Object? category = freezed,
    Object? description = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$ReportFormStateImpl(
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as File?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ReportCategory?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ReportFormStateImpl implements _ReportFormState {
  const _$ReportFormStateImpl(
      {this.photo,
      this.location,
      this.address,
      this.category,
      this.description = '',
      this.isLoading = false,
      this.isSuccess = false,
      this.errorMessage});

  @override
  final File? photo;
  @override
  final LatLng? location;
  @override
  final String? address;
  @override
  final ReportCategory? category;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ReportFormState(photo: $photo, location: $location, address: $address, category: $category, description: $description, isLoading: $isLoading, isSuccess: $isSuccess, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportFormStateImpl &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, photo, location, address,
      category, description, isLoading, isSuccess, errorMessage);

  /// Create a copy of ReportFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportFormStateImplCopyWith<_$ReportFormStateImpl> get copyWith =>
      __$$ReportFormStateImplCopyWithImpl<_$ReportFormStateImpl>(
          this, _$identity);
}

abstract class _ReportFormState implements ReportFormState {
  const factory _ReportFormState(
      {final File? photo,
      final LatLng? location,
      final String? address,
      final ReportCategory? category,
      final String description,
      final bool isLoading,
      final bool isSuccess,
      final String? errorMessage}) = _$ReportFormStateImpl;

  @override
  File? get photo;
  @override
  LatLng? get location;
  @override
  String? get address;
  @override
  ReportCategory? get category;
  @override
  String get description;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  String? get errorMessage;

  /// Create a copy of ReportFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportFormStateImplCopyWith<_$ReportFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
