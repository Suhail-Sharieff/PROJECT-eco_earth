// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VendorImpl _$$VendorImplFromJson(Map<String, dynamic> json) => _$VendorImpl(
      firebaseUid: json['firebase_uid'] as String? ?? 'no_firebase_uid_given',
      vendor_name: json['vendor_name'] as String? ?? 'no_vendor_name_given',
      vendor_location:
          json['vendor_location'] as String? ?? 'no_location_given',
      vendor_shop_name:
          json['vendor_shop_name'] as String? ?? 'no_shop_name_given',
      rating: (json['vendor_rating'] as num?)?.toInt() ?? 0,
      vendor_phone_number:
          json['vendor_phone_number'] as String? ?? '+91 12345 67890',
      types_cost_map: json['type_cost_map'] as Map<String, dynamic>? ??
          const {'e-waste': 110},
    );

Map<String, dynamic> _$$VendorImplToJson(_$VendorImpl instance) =>
    <String, dynamic>{
      'firebase_uid': instance.firebaseUid,
      'vendor_name': instance.vendor_name,
      'vendor_location': instance.vendor_location,
      'vendor_shop_name': instance.vendor_shop_name,
      'vendor_rating': instance.rating,
      'vendor_phone_number': instance.vendor_phone_number,
      'type_cost_map': instance.types_cost_map,
    };
