// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContractImpl _$$ContractImplFromJson(Map<String, dynamic> json) =>
    _$ContractImpl(
      id: (json['id'] as num?)?.toInt(),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      from_id: json['from_id'] as String? ?? 'no-from-id',
      to_id: json['to_id'] as String? ?? 'no-to-id',
      customer_name: json['customer_name'] as String? ?? 'no-customer-name',
      contract_status: json['contract_status'] as String? ?? 'Pending',
      item_number_map:
          json['item_number_map'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$ContractImplToJson(_$ContractImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'created_at': instance.created_at?.toIso8601String(),
      'from_id': instance.from_id,
      'to_id': instance.to_id,
      'customer_name': instance.customer_name,
      'contract_status': instance.contract_status,
      'item_number_map': instance.item_number_map,
    };
