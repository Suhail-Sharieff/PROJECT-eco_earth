// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Contract _$ContractFromJson(Map<String, dynamic> json) {
  return _Contract.fromJson(json);
}

/// @nodoc
mixin _$Contract {
  @JsonKey(name: 'created_at')
  DateTime? get created_at => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_id')
  String get from_id => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_id')
  String get to_id => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String get customer_name => throw _privateConstructorUsedError;
  @JsonKey(name: 'contract_status')
  String get contract_status => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_number_map')
  Map<String, dynamic> get item_number_map =>
      throw _privateConstructorUsedError;

  /// Serializes this Contract to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Contract
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContractCopyWith<Contract> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContractCopyWith<$Res> {
  factory $ContractCopyWith(Contract value, $Res Function(Contract) then) =
      _$ContractCopyWithImpl<$Res, Contract>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at') DateTime? created_at,
      @JsonKey(name: 'from_id') String from_id,
      @JsonKey(name: 'to_id') String to_id,
      @JsonKey(name: 'customer_name') String customer_name,
      @JsonKey(name: 'contract_status') String contract_status,
      @JsonKey(name: 'item_number_map') Map<String, dynamic> item_number_map});
}

/// @nodoc
class _$ContractCopyWithImpl<$Res, $Val extends Contract>
    implements $ContractCopyWith<$Res> {
  _$ContractCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Contract
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? created_at = freezed,
    Object? from_id = null,
    Object? to_id = null,
    Object? customer_name = null,
    Object? contract_status = null,
    Object? item_number_map = null,
  }) {
    return _then(_value.copyWith(
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      from_id: null == from_id
          ? _value.from_id
          : from_id // ignore: cast_nullable_to_non_nullable
              as String,
      to_id: null == to_id
          ? _value.to_id
          : to_id // ignore: cast_nullable_to_non_nullable
              as String,
      customer_name: null == customer_name
          ? _value.customer_name
          : customer_name // ignore: cast_nullable_to_non_nullable
              as String,
      contract_status: null == contract_status
          ? _value.contract_status
          : contract_status // ignore: cast_nullable_to_non_nullable
              as String,
      item_number_map: null == item_number_map
          ? _value.item_number_map
          : item_number_map // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContractImplCopyWith<$Res>
    implements $ContractCopyWith<$Res> {
  factory _$$ContractImplCopyWith(
          _$ContractImpl value, $Res Function(_$ContractImpl) then) =
      __$$ContractImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at') DateTime? created_at,
      @JsonKey(name: 'from_id') String from_id,
      @JsonKey(name: 'to_id') String to_id,
      @JsonKey(name: 'customer_name') String customer_name,
      @JsonKey(name: 'contract_status') String contract_status,
      @JsonKey(name: 'item_number_map') Map<String, dynamic> item_number_map});
}

/// @nodoc
class __$$ContractImplCopyWithImpl<$Res>
    extends _$ContractCopyWithImpl<$Res, _$ContractImpl>
    implements _$$ContractImplCopyWith<$Res> {
  __$$ContractImplCopyWithImpl(
      _$ContractImpl _value, $Res Function(_$ContractImpl) _then)
      : super(_value, _then);

  /// Create a copy of Contract
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? created_at = freezed,
    Object? from_id = null,
    Object? to_id = null,
    Object? customer_name = null,
    Object? contract_status = null,
    Object? item_number_map = null,
  }) {
    return _then(_$ContractImpl(
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      from_id: null == from_id
          ? _value.from_id
          : from_id // ignore: cast_nullable_to_non_nullable
              as String,
      to_id: null == to_id
          ? _value.to_id
          : to_id // ignore: cast_nullable_to_non_nullable
              as String,
      customer_name: null == customer_name
          ? _value.customer_name
          : customer_name // ignore: cast_nullable_to_non_nullable
              as String,
      contract_status: null == contract_status
          ? _value.contract_status
          : contract_status // ignore: cast_nullable_to_non_nullable
              as String,
      item_number_map: null == item_number_map
          ? _value._item_number_map
          : item_number_map // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ContractImpl implements _Contract {
  _$ContractImpl(
      {@JsonKey(name: 'created_at') this.created_at,
      @JsonKey(name: 'from_id') this.from_id = 'no-from-id',
      @JsonKey(name: 'to_id') this.to_id = 'no-to-id',
      @JsonKey(name: 'customer_name') this.customer_name = 'no-customer-name',
      @JsonKey(name: 'contract_status') this.contract_status = 'Pending',
      @JsonKey(name: 'item_number_map')
      final Map<String, dynamic> item_number_map = const {}})
      : _item_number_map = item_number_map;

  factory _$ContractImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContractImplFromJson(json);

  @override
  @JsonKey(name: 'created_at')
  final DateTime? created_at;
  @override
  @JsonKey(name: 'from_id')
  final String from_id;
  @override
  @JsonKey(name: 'to_id')
  final String to_id;
  @override
  @JsonKey(name: 'customer_name')
  final String customer_name;
  @override
  @JsonKey(name: 'contract_status')
  final String contract_status;
  final Map<String, dynamic> _item_number_map;
  @override
  @JsonKey(name: 'item_number_map')
  Map<String, dynamic> get item_number_map {
    if (_item_number_map is EqualUnmodifiableMapView) return _item_number_map;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_item_number_map);
  }

  @override
  String toString() {
    return 'Contract(created_at: $created_at, from_id: $from_id, to_id: $to_id, customer_name: $customer_name, contract_status: $contract_status, item_number_map: $item_number_map)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContractImpl &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.from_id, from_id) || other.from_id == from_id) &&
            (identical(other.to_id, to_id) || other.to_id == to_id) &&
            (identical(other.customer_name, customer_name) ||
                other.customer_name == customer_name) &&
            (identical(other.contract_status, contract_status) ||
                other.contract_status == contract_status) &&
            const DeepCollectionEquality()
                .equals(other._item_number_map, _item_number_map));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      created_at,
      from_id,
      to_id,
      customer_name,
      contract_status,
      const DeepCollectionEquality().hash(_item_number_map));

  /// Create a copy of Contract
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContractImplCopyWith<_$ContractImpl> get copyWith =>
      __$$ContractImplCopyWithImpl<_$ContractImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContractImplToJson(
      this,
    );
  }
}

abstract class _Contract implements Contract {
  factory _Contract(
      {@JsonKey(name: 'created_at') final DateTime? created_at,
      @JsonKey(name: 'from_id') final String from_id,
      @JsonKey(name: 'to_id') final String to_id,
      @JsonKey(name: 'customer_name') final String customer_name,
      @JsonKey(name: 'contract_status') final String contract_status,
      @JsonKey(name: 'item_number_map')
      final Map<String, dynamic> item_number_map}) = _$ContractImpl;

  factory _Contract.fromJson(Map<String, dynamic> json) =
      _$ContractImpl.fromJson;

  @override
  @JsonKey(name: 'created_at')
  DateTime? get created_at;
  @override
  @JsonKey(name: 'from_id')
  String get from_id;
  @override
  @JsonKey(name: 'to_id')
  String get to_id;
  @override
  @JsonKey(name: 'customer_name')
  String get customer_name;
  @override
  @JsonKey(name: 'contract_status')
  String get contract_status;
  @override
  @JsonKey(name: 'item_number_map')
  Map<String, dynamic> get item_number_map;

  /// Create a copy of Contract
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContractImplCopyWith<_$ContractImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
