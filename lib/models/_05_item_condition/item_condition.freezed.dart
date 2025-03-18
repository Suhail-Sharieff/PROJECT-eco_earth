// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_condition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemCondition _$ItemConditionFromJson(Map<String, dynamic> json) {
  return _ItemCondition.fromJson(json);
}

/// @nodoc
mixin _$ItemCondition {
// New fields
  @JsonKey(name: 'purchased_date')
  String get purchased_date => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_working')
  bool get is_working => throw _privateConstructorUsedError;
  @JsonKey(name: 'needs_repairs')
  bool get needs_repairs => throw _privateConstructorUsedError;

  /// Serializes this ItemCondition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ItemCondition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemConditionCopyWith<ItemCondition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemConditionCopyWith<$Res> {
  factory $ItemConditionCopyWith(
          ItemCondition value, $Res Function(ItemCondition) then) =
      _$ItemConditionCopyWithImpl<$Res, ItemCondition>;
  @useResult
  $Res call(
      {@JsonKey(name: 'purchased_date') String purchased_date,
      @JsonKey(name: 'is_working') bool is_working,
      @JsonKey(name: 'needs_repairs') bool needs_repairs});
}

/// @nodoc
class _$ItemConditionCopyWithImpl<$Res, $Val extends ItemCondition>
    implements $ItemConditionCopyWith<$Res> {
  _$ItemConditionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemCondition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchased_date = null,
    Object? is_working = null,
    Object? needs_repairs = null,
  }) {
    return _then(_value.copyWith(
      purchased_date: null == purchased_date
          ? _value.purchased_date
          : purchased_date // ignore: cast_nullable_to_non_nullable
              as String,
      is_working: null == is_working
          ? _value.is_working
          : is_working // ignore: cast_nullable_to_non_nullable
              as bool,
      needs_repairs: null == needs_repairs
          ? _value.needs_repairs
          : needs_repairs // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemConditionImplCopyWith<$Res>
    implements $ItemConditionCopyWith<$Res> {
  factory _$$ItemConditionImplCopyWith(
          _$ItemConditionImpl value, $Res Function(_$ItemConditionImpl) then) =
      __$$ItemConditionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'purchased_date') String purchased_date,
      @JsonKey(name: 'is_working') bool is_working,
      @JsonKey(name: 'needs_repairs') bool needs_repairs});
}

/// @nodoc
class __$$ItemConditionImplCopyWithImpl<$Res>
    extends _$ItemConditionCopyWithImpl<$Res, _$ItemConditionImpl>
    implements _$$ItemConditionImplCopyWith<$Res> {
  __$$ItemConditionImplCopyWithImpl(
      _$ItemConditionImpl _value, $Res Function(_$ItemConditionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemCondition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchased_date = null,
    Object? is_working = null,
    Object? needs_repairs = null,
  }) {
    return _then(_$ItemConditionImpl(
      purchased_date: null == purchased_date
          ? _value.purchased_date
          : purchased_date // ignore: cast_nullable_to_non_nullable
              as String,
      is_working: null == is_working
          ? _value.is_working
          : is_working // ignore: cast_nullable_to_non_nullable
              as bool,
      needs_repairs: null == needs_repairs
          ? _value.needs_repairs
          : needs_repairs // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ItemConditionImpl implements _ItemCondition {
  _$ItemConditionImpl(
      {@JsonKey(name: 'purchased_date') this.purchased_date = '01/01/00',
      @JsonKey(name: 'is_working') this.is_working = true,
      @JsonKey(name: 'needs_repairs') this.needs_repairs = false});

  factory _$ItemConditionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemConditionImplFromJson(json);

// New fields
  @override
  @JsonKey(name: 'purchased_date')
  final String purchased_date;
  @override
  @JsonKey(name: 'is_working')
  final bool is_working;
  @override
  @JsonKey(name: 'needs_repairs')
  final bool needs_repairs;

  @override
  String toString() {
    return 'ItemCondition(purchased_date: $purchased_date, is_working: $is_working, needs_repairs: $needs_repairs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemConditionImpl &&
            (identical(other.purchased_date, purchased_date) ||
                other.purchased_date == purchased_date) &&
            (identical(other.is_working, is_working) ||
                other.is_working == is_working) &&
            (identical(other.needs_repairs, needs_repairs) ||
                other.needs_repairs == needs_repairs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, purchased_date, is_working, needs_repairs);

  /// Create a copy of ItemCondition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemConditionImplCopyWith<_$ItemConditionImpl> get copyWith =>
      __$$ItemConditionImplCopyWithImpl<_$ItemConditionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemConditionImplToJson(
      this,
    );
  }
}

abstract class _ItemCondition implements ItemCondition {
  factory _ItemCondition(
          {@JsonKey(name: 'purchased_date') final String purchased_date,
          @JsonKey(name: 'is_working') final bool is_working,
          @JsonKey(name: 'needs_repairs') final bool needs_repairs}) =
      _$ItemConditionImpl;

  factory _ItemCondition.fromJson(Map<String, dynamic> json) =
      _$ItemConditionImpl.fromJson;

// New fields
  @override
  @JsonKey(name: 'purchased_date')
  String get purchased_date;
  @override
  @JsonKey(name: 'is_working')
  bool get is_working;
  @override
  @JsonKey(name: 'needs_repairs')
  bool get needs_repairs;

  /// Create a copy of ItemCondition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemConditionImplCopyWith<_$ItemConditionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
