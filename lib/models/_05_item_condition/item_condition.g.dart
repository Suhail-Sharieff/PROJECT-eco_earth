// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemConditionImpl _$$ItemConditionImplFromJson(Map<String, dynamic> json) =>
    _$ItemConditionImpl(
      purchased_date: json['purchased_date'] as String? ?? '01/01/00',
      is_working: json['is_working'] as bool? ?? true,
      needs_repairs: json['needs_repairs'] as bool? ?? false,
    );

Map<String, dynamic> _$$ItemConditionImplToJson(_$ItemConditionImpl instance) =>
    <String, dynamic>{
      'purchased_date': instance.purchased_date,
      'is_working': instance.is_working,
      'needs_repairs': instance.needs_repairs,
    };
