// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reusable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReusableImpl _$$ReusableImplFromJson(Map<String, dynamic> json) =>
    _$ReusableImpl(
      id: (json['id'] as num?)?.toInt(),
      owner: json['owner'] as String? ?? 'no_owner',
      buyer: json['buyer'] as String? ?? 'no_buyer',
      photo_url: json['photo_url'] as String? ??
          'https://images.pexels.com/photos/211492/pexels-photo-211492.jpeg?cs=srgb&dl=pexels-omkar-patyane-211492.jpg&fm=jpg',
      cost: (json['cost'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? 'title',
      status: (json['status'] as num?)?.toInt() ?? 0,
      condition: json['item_condition_map'] == null
          ? null
          : ItemCondition.fromJson(
              json['item_condition_map'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReusableImplToJson(_$ReusableImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'owner': instance.owner,
      'buyer': instance.buyer,
      'photo_url': instance.photo_url,
      'cost': instance.cost,
      'title': instance.title,
      'status': instance.status,
      'item_condition_map': instance.condition?.toJson(),
    };
