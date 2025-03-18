// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reusable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Reusable _$ReusableFromJson(Map<String, dynamic> json) {
  return _Reusable.fromJson(json);
}

/// @nodoc
mixin _$Reusable {
  @JsonKey(name: 'owner')
  String get owner => throw _privateConstructorUsedError;
  @JsonKey(name: 'buyer')
  String get buyer => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_url')
  String get photo_url => throw _privateConstructorUsedError;
  @JsonKey(name: 'cost')
  int get cost => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  int get status => throw _privateConstructorUsedError;

  /// Serializes this Reusable to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Reusable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReusableCopyWith<Reusable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReusableCopyWith<$Res> {
  factory $ReusableCopyWith(Reusable value, $Res Function(Reusable) then) =
      _$ReusableCopyWithImpl<$Res, Reusable>;
  @useResult
  $Res call(
      {@JsonKey(name: 'owner') String owner,
      @JsonKey(name: 'buyer') String buyer,
      @JsonKey(name: 'photo_url') String photo_url,
      @JsonKey(name: 'cost') int cost,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'status') int status});
}

/// @nodoc
class _$ReusableCopyWithImpl<$Res, $Val extends Reusable>
    implements $ReusableCopyWith<$Res> {
  _$ReusableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Reusable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? owner = null,
    Object? buyer = null,
    Object? photo_url = null,
    Object? cost = null,
    Object? title = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      buyer: null == buyer
          ? _value.buyer
          : buyer // ignore: cast_nullable_to_non_nullable
              as String,
      photo_url: null == photo_url
          ? _value.photo_url
          : photo_url // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReusableImplCopyWith<$Res>
    implements $ReusableCopyWith<$Res> {
  factory _$$ReusableImplCopyWith(
          _$ReusableImpl value, $Res Function(_$ReusableImpl) then) =
      __$$ReusableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'owner') String owner,
      @JsonKey(name: 'buyer') String buyer,
      @JsonKey(name: 'photo_url') String photo_url,
      @JsonKey(name: 'cost') int cost,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'status') int status});
}

/// @nodoc
class __$$ReusableImplCopyWithImpl<$Res>
    extends _$ReusableCopyWithImpl<$Res, _$ReusableImpl>
    implements _$$ReusableImplCopyWith<$Res> {
  __$$ReusableImplCopyWithImpl(
      _$ReusableImpl _value, $Res Function(_$ReusableImpl) _then)
      : super(_value, _then);

  /// Create a copy of Reusable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? owner = null,
    Object? buyer = null,
    Object? photo_url = null,
    Object? cost = null,
    Object? title = null,
    Object? status = null,
  }) {
    return _then(_$ReusableImpl(
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      buyer: null == buyer
          ? _value.buyer
          : buyer // ignore: cast_nullable_to_non_nullable
              as String,
      photo_url: null == photo_url
          ? _value.photo_url
          : photo_url // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ReusableImpl implements _Reusable {
  _$ReusableImpl(
      {@JsonKey(name: 'owner') this.owner = 'no_owner',
      @JsonKey(name: 'buyer') this.buyer = 'no_buyer',
      @JsonKey(name: 'photo_url') this.photo_url = 'photo_url',
      @JsonKey(name: 'cost') this.cost = 0,
      @JsonKey(name: 'title') this.title = 'title',
      @JsonKey(name: 'status') this.status = 0});

  factory _$ReusableImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReusableImplFromJson(json);

  @override
  @JsonKey(name: 'owner')
  final String owner;
  @override
  @JsonKey(name: 'buyer')
  final String buyer;
  @override
  @JsonKey(name: 'photo_url')
  final String photo_url;
  @override
  @JsonKey(name: 'cost')
  final int cost;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'status')
  final int status;

  @override
  String toString() {
    return 'Reusable(owner: $owner, buyer: $buyer, photo_url: $photo_url, cost: $cost, title: $title, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReusableImpl &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.buyer, buyer) || other.buyer == buyer) &&
            (identical(other.photo_url, photo_url) ||
                other.photo_url == photo_url) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, owner, buyer, photo_url, cost, title, status);

  /// Create a copy of Reusable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReusableImplCopyWith<_$ReusableImpl> get copyWith =>
      __$$ReusableImplCopyWithImpl<_$ReusableImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReusableImplToJson(
      this,
    );
  }
}

abstract class _Reusable implements Reusable {
  factory _Reusable(
      {@JsonKey(name: 'owner') final String owner,
      @JsonKey(name: 'buyer') final String buyer,
      @JsonKey(name: 'photo_url') final String photo_url,
      @JsonKey(name: 'cost') final int cost,
      @JsonKey(name: 'title') final String title,
      @JsonKey(name: 'status') final int status}) = _$ReusableImpl;

  factory _Reusable.fromJson(Map<String, dynamic> json) =
      _$ReusableImpl.fromJson;

  @override
  @JsonKey(name: 'owner')
  String get owner;
  @override
  @JsonKey(name: 'buyer')
  String get buyer;
  @override
  @JsonKey(name: 'photo_url')
  String get photo_url;
  @override
  @JsonKey(name: 'cost')
  int get cost;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'status')
  int get status;

  /// Create a copy of Reusable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReusableImplCopyWith<_$ReusableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
