// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ComplaintImpl _$$ComplaintImplFromJson(Map<String, dynamic> json) =>
    _$ComplaintImpl(
      complaintId: (json['complaint_id'] as num?)?.toInt() ?? -1,
      createdAt: json['created_at'] as String? ?? 'no_class_name_given',
      firebaseUid: json['firebase_uid'] as String? ?? 'no_firebase_uid_given',
      photoUrl: json['photo_url'] as String? ?? 'no_photo_url_given',
      location: json['location'] as String? ?? 'no_location_given',
      description: json['description'] as String? ?? 'no_description_given',
      noOfLikes: (json['no_of_likes'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ComplaintImplToJson(_$ComplaintImpl instance) =>
    <String, dynamic>{
      'complaint_id': instance.complaintId,
      'created_at': instance.createdAt,
      'firebase_uid': instance.firebaseUid,
      'photo_url': instance.photoUrl,
      'location': instance.location,
      'description': instance.description,
      'no_of_likes': instance.noOfLikes,
    };
