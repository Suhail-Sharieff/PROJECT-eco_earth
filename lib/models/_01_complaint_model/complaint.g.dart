// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ComplaintImpl _$$ComplaintImplFromJson(Map<String, dynamic> json) =>
    _$ComplaintImpl(
      createdAt: json['created_at'] as String? ?? '12/12/2025',
      firebaseUid: json['firebase_uid'] as String? ?? 'no_firebase_uid_given',
      photoUrl: json['photo_url'] as String? ?? 'no_photo_url_given',
      location: json['location'] as String? ?? 'no_location_given',
      description: json['description'] as String? ?? 'no_description_given',
      noOfLikes: (json['no_of_likes'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ComplaintImplToJson(_$ComplaintImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'firebase_uid': instance.firebaseUid,
      'photo_url': instance.photoUrl,
      'location': instance.location,
      'description': instance.description,
      'no_of_likes': instance.noOfLikes,
    };
