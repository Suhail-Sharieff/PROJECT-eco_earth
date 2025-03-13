import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'complaint.freezed.dart';
part 'complaint.g.dart'; // Ensure JSON serialization works

//flutter packages pub run build_runner build

@freezed
class Complaint with _$Complaint {
  @JsonSerializable(explicitToJson: true)
  factory Complaint({
    @Default('12/12/2025') @JsonKey(name: 'created_at') String createdAt,
    @Default('no_firebase_uid_given') @JsonKey(name: 'firebase_uid') String firebaseUid,
    @Default('no_photo_url_given') @JsonKey(name: 'photo_url') String photoUrl,
    @Default('no_location_given') @JsonKey(name: 'location') String location,
    @Default('no_description_given') @JsonKey(name: 'description') String description,
    @Default(0) @JsonKey(name: 'no_of_likes') int noOfLikes,
  }) = _Complaint;

  factory Complaint.fromJson(Map<String, dynamic> json) => _$ComplaintFromJson(json);
}
