// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reusable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReusableImpl _$$ReusableImplFromJson(Map<String, dynamic> json) =>
    _$ReusableImpl(
      owner: json['owner'] as String? ?? 'no_owner',
      buyer: json['buyer'] as String? ?? 'no_buyer',
      photo_url: json['photo_url'] as String? ?? 'photo_url',
      cost: (json['cost'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? 'title',
      status: (json['status'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ReusableImplToJson(_$ReusableImpl instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'buyer': instance.buyer,
      'photo_url': instance.photo_url,
      'cost': instance.cost,
      'title': instance.title,
      'status': instance.status,
    };
