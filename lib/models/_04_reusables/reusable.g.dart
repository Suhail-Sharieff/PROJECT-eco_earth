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
      condition: json['item_condition_map'] == null
          ? null
          : ItemCondition.fromJson(
              json['item_condition_map'] as Map<String, dynamic>),
      pickup_location:
          json['pickup_location'] as String? ?? 'No pickup address provided',
      order_status:
          $enumDecodeNullable(_$OrderStatusEnumMap, json['order_status']) ??
              OrderStatus.Approved,
    );

Map<String, dynamic> _$$ReusableImplToJson(_$ReusableImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'owner': instance.owner,
      'buyer': instance.buyer,
      'photo_url': instance.photo_url,
      'cost': instance.cost,
      'title': instance.title,
      'item_condition_map': instance.condition?.toJson(),
      'pickup_location': instance.pickup_location,
      'order_status': _$OrderStatusEnumMap[instance.order_status]!,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.Approved: 'Approved',
  OrderStatus.Packed: 'Packed',
  OrderStatus.Shipped: 'Shipped',
  OrderStatus.Delivered: 'Delivered',
  OrderStatus.Paid: 'Paid',
  OrderStatus.Cancelled: 'Cancelled',
};
