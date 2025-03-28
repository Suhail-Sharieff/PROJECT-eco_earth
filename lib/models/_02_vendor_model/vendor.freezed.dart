// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Vendor _$VendorFromJson(Map<String, dynamic> json) {
  return _Vendor.fromJson(json);
}

/// @nodoc
mixin _$Vendor {
  @JsonKey(name: 'firebase_uid')
  String get firebaseUid => throw _privateConstructorUsedError;
  @JsonKey(name: 'vendor_name')
  String get vendor_name => throw _privateConstructorUsedError;
  @JsonKey(name: 'vendor_location')
  String get vendor_location => throw _privateConstructorUsedError;
  @JsonKey(name: 'vendor_shop_name')
  String get vendor_shop_name => throw _privateConstructorUsedError;
  @JsonKey(name: 'vendor_rating')
  int get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'vendor_phone_number')
  String get vendor_phone_number => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_cost_map')
  Map<String, dynamic> get types_cost_map => throw _privateConstructorUsedError;

  /// Serializes this Vendor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Vendor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VendorCopyWith<Vendor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorCopyWith<$Res> {
  factory $VendorCopyWith(Vendor value, $Res Function(Vendor) then) =
      _$VendorCopyWithImpl<$Res, Vendor>;
  @useResult
  $Res call(
      {@JsonKey(name: 'firebase_uid') String firebaseUid,
      @JsonKey(name: 'vendor_name') String vendor_name,
      @JsonKey(name: 'vendor_location') String vendor_location,
      @JsonKey(name: 'vendor_shop_name') String vendor_shop_name,
      @JsonKey(name: 'vendor_rating') int rating,
      @JsonKey(name: 'vendor_phone_number') String vendor_phone_number,
      @JsonKey(name: 'type_cost_map') Map<String, dynamic> types_cost_map});
}

/// @nodoc
class _$VendorCopyWithImpl<$Res, $Val extends Vendor>
    implements $VendorCopyWith<$Res> {
  _$VendorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Vendor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firebaseUid = null,
    Object? vendor_name = null,
    Object? vendor_location = null,
    Object? vendor_shop_name = null,
    Object? rating = null,
    Object? vendor_phone_number = null,
    Object? types_cost_map = null,
  }) {
    return _then(_value.copyWith(
      firebaseUid: null == firebaseUid
          ? _value.firebaseUid
          : firebaseUid // ignore: cast_nullable_to_non_nullable
              as String,
      vendor_name: null == vendor_name
          ? _value.vendor_name
          : vendor_name // ignore: cast_nullable_to_non_nullable
              as String,
      vendor_location: null == vendor_location
          ? _value.vendor_location
          : vendor_location // ignore: cast_nullable_to_non_nullable
              as String,
      vendor_shop_name: null == vendor_shop_name
          ? _value.vendor_shop_name
          : vendor_shop_name // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      vendor_phone_number: null == vendor_phone_number
          ? _value.vendor_phone_number
          : vendor_phone_number // ignore: cast_nullable_to_non_nullable
              as String,
      types_cost_map: null == types_cost_map
          ? _value.types_cost_map
          : types_cost_map // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VendorImplCopyWith<$Res> implements $VendorCopyWith<$Res> {
  factory _$$VendorImplCopyWith(
          _$VendorImpl value, $Res Function(_$VendorImpl) then) =
      __$$VendorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'firebase_uid') String firebaseUid,
      @JsonKey(name: 'vendor_name') String vendor_name,
      @JsonKey(name: 'vendor_location') String vendor_location,
      @JsonKey(name: 'vendor_shop_name') String vendor_shop_name,
      @JsonKey(name: 'vendor_rating') int rating,
      @JsonKey(name: 'vendor_phone_number') String vendor_phone_number,
      @JsonKey(name: 'type_cost_map') Map<String, dynamic> types_cost_map});
}

/// @nodoc
class __$$VendorImplCopyWithImpl<$Res>
    extends _$VendorCopyWithImpl<$Res, _$VendorImpl>
    implements _$$VendorImplCopyWith<$Res> {
  __$$VendorImplCopyWithImpl(
      _$VendorImpl _value, $Res Function(_$VendorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Vendor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firebaseUid = null,
    Object? vendor_name = null,
    Object? vendor_location = null,
    Object? vendor_shop_name = null,
    Object? rating = null,
    Object? vendor_phone_number = null,
    Object? types_cost_map = null,
  }) {
    return _then(_$VendorImpl(
      firebaseUid: null == firebaseUid
          ? _value.firebaseUid
          : firebaseUid // ignore: cast_nullable_to_non_nullable
              as String,
      vendor_name: null == vendor_name
          ? _value.vendor_name
          : vendor_name // ignore: cast_nullable_to_non_nullable
              as String,
      vendor_location: null == vendor_location
          ? _value.vendor_location
          : vendor_location // ignore: cast_nullable_to_non_nullable
              as String,
      vendor_shop_name: null == vendor_shop_name
          ? _value.vendor_shop_name
          : vendor_shop_name // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      vendor_phone_number: null == vendor_phone_number
          ? _value.vendor_phone_number
          : vendor_phone_number // ignore: cast_nullable_to_non_nullable
              as String,
      types_cost_map: null == types_cost_map
          ? _value._types_cost_map
          : types_cost_map // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$VendorImpl implements _Vendor {
  _$VendorImpl(
      {@JsonKey(name: 'firebase_uid')
      this.firebaseUid = 'no_firebase_uid_given',
      @JsonKey(name: 'vendor_name') this.vendor_name = 'no_vendor_name_given',
      @JsonKey(name: 'vendor_location')
      this.vendor_location = 'no_location_given',
      @JsonKey(name: 'vendor_shop_name')
      this.vendor_shop_name = 'no_shop_name_given',
      @JsonKey(name: 'vendor_rating') this.rating = 0,
      @JsonKey(name: 'vendor_phone_number')
      this.vendor_phone_number = '+91 12345 67890',
      @JsonKey(name: 'type_cost_map')
      final Map<String, dynamic> types_cost_map = const {'e-waste': 110}})
      : _types_cost_map = types_cost_map;

  factory _$VendorImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorImplFromJson(json);

  @override
  @JsonKey(name: 'firebase_uid')
  final String firebaseUid;
  @override
  @JsonKey(name: 'vendor_name')
  final String vendor_name;
  @override
  @JsonKey(name: 'vendor_location')
  final String vendor_location;
  @override
  @JsonKey(name: 'vendor_shop_name')
  final String vendor_shop_name;
  @override
  @JsonKey(name: 'vendor_rating')
  final int rating;
  @override
  @JsonKey(name: 'vendor_phone_number')
  final String vendor_phone_number;
  final Map<String, dynamic> _types_cost_map;
  @override
  @JsonKey(name: 'type_cost_map')
  Map<String, dynamic> get types_cost_map {
    if (_types_cost_map is EqualUnmodifiableMapView) return _types_cost_map;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_types_cost_map);
  }

  @override
  String toString() {
    return 'Vendor(firebaseUid: $firebaseUid, vendor_name: $vendor_name, vendor_location: $vendor_location, vendor_shop_name: $vendor_shop_name, rating: $rating, vendor_phone_number: $vendor_phone_number, types_cost_map: $types_cost_map)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorImpl &&
            (identical(other.firebaseUid, firebaseUid) ||
                other.firebaseUid == firebaseUid) &&
            (identical(other.vendor_name, vendor_name) ||
                other.vendor_name == vendor_name) &&
            (identical(other.vendor_location, vendor_location) ||
                other.vendor_location == vendor_location) &&
            (identical(other.vendor_shop_name, vendor_shop_name) ||
                other.vendor_shop_name == vendor_shop_name) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.vendor_phone_number, vendor_phone_number) ||
                other.vendor_phone_number == vendor_phone_number) &&
            const DeepCollectionEquality()
                .equals(other._types_cost_map, _types_cost_map));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      firebaseUid,
      vendor_name,
      vendor_location,
      vendor_shop_name,
      rating,
      vendor_phone_number,
      const DeepCollectionEquality().hash(_types_cost_map));

  /// Create a copy of Vendor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorImplCopyWith<_$VendorImpl> get copyWith =>
      __$$VendorImplCopyWithImpl<_$VendorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorImplToJson(
      this,
    );
  }
}

abstract class _Vendor implements Vendor {
  factory _Vendor(
      {@JsonKey(name: 'firebase_uid') final String firebaseUid,
      @JsonKey(name: 'vendor_name') final String vendor_name,
      @JsonKey(name: 'vendor_location') final String vendor_location,
      @JsonKey(name: 'vendor_shop_name') final String vendor_shop_name,
      @JsonKey(name: 'vendor_rating') final int rating,
      @JsonKey(name: 'vendor_phone_number') final String vendor_phone_number,
      @JsonKey(name: 'type_cost_map')
      final Map<String, dynamic> types_cost_map}) = _$VendorImpl;

  factory _Vendor.fromJson(Map<String, dynamic> json) = _$VendorImpl.fromJson;

  @override
  @JsonKey(name: 'firebase_uid')
  String get firebaseUid;
  @override
  @JsonKey(name: 'vendor_name')
  String get vendor_name;
  @override
  @JsonKey(name: 'vendor_location')
  String get vendor_location;
  @override
  @JsonKey(name: 'vendor_shop_name')
  String get vendor_shop_name;
  @override
  @JsonKey(name: 'vendor_rating')
  int get rating;
  @override
  @JsonKey(name: 'vendor_phone_number')
  String get vendor_phone_number;
  @override
  @JsonKey(name: 'type_cost_map')
  Map<String, dynamic> get types_cost_map;

  /// Create a copy of Vendor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VendorImplCopyWith<_$VendorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
