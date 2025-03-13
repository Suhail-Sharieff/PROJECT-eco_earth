// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complaint.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Complaint _$ComplaintFromJson(Map<String, dynamic> json) {
  return _Complaint.fromJson(json);
}

/// @nodoc
mixin _$Complaint {
  @JsonKey(name: 'complaint_id')
  int get complaintId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'firebase_uid')
  String get firebaseUid => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_url')
  String get photoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'location')
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'no_of_likes')
  int get noOfLikes => throw _privateConstructorUsedError;

  /// Serializes this Complaint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Complaint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ComplaintCopyWith<Complaint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComplaintCopyWith<$Res> {
  factory $ComplaintCopyWith(Complaint value, $Res Function(Complaint) then) =
      _$ComplaintCopyWithImpl<$Res, Complaint>;
  @useResult
  $Res call(
      {@JsonKey(name: 'complaint_id') int complaintId,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'firebase_uid') String firebaseUid,
      @JsonKey(name: 'photo_url') String photoUrl,
      @JsonKey(name: 'location') String location,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'no_of_likes') int noOfLikes});
}

/// @nodoc
class _$ComplaintCopyWithImpl<$Res, $Val extends Complaint>
    implements $ComplaintCopyWith<$Res> {
  _$ComplaintCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Complaint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? complaintId = null,
    Object? createdAt = null,
    Object? firebaseUid = null,
    Object? photoUrl = null,
    Object? location = null,
    Object? description = null,
    Object? noOfLikes = null,
  }) {
    return _then(_value.copyWith(
      complaintId: null == complaintId
          ? _value.complaintId
          : complaintId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      firebaseUid: null == firebaseUid
          ? _value.firebaseUid
          : firebaseUid // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      noOfLikes: null == noOfLikes
          ? _value.noOfLikes
          : noOfLikes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComplaintImplCopyWith<$Res>
    implements $ComplaintCopyWith<$Res> {
  factory _$$ComplaintImplCopyWith(
          _$ComplaintImpl value, $Res Function(_$ComplaintImpl) then) =
      __$$ComplaintImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'complaint_id') int complaintId,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'firebase_uid') String firebaseUid,
      @JsonKey(name: 'photo_url') String photoUrl,
      @JsonKey(name: 'location') String location,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'no_of_likes') int noOfLikes});
}

/// @nodoc
class __$$ComplaintImplCopyWithImpl<$Res>
    extends _$ComplaintCopyWithImpl<$Res, _$ComplaintImpl>
    implements _$$ComplaintImplCopyWith<$Res> {
  __$$ComplaintImplCopyWithImpl(
      _$ComplaintImpl _value, $Res Function(_$ComplaintImpl) _then)
      : super(_value, _then);

  /// Create a copy of Complaint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? complaintId = null,
    Object? createdAt = null,
    Object? firebaseUid = null,
    Object? photoUrl = null,
    Object? location = null,
    Object? description = null,
    Object? noOfLikes = null,
  }) {
    return _then(_$ComplaintImpl(
      complaintId: null == complaintId
          ? _value.complaintId
          : complaintId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      firebaseUid: null == firebaseUid
          ? _value.firebaseUid
          : firebaseUid // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      noOfLikes: null == noOfLikes
          ? _value.noOfLikes
          : noOfLikes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ComplaintImpl implements _Complaint {
  _$ComplaintImpl(
      {@JsonKey(name: 'complaint_id') this.complaintId = -1,
      @JsonKey(name: 'created_at') this.createdAt = 'no_class_name_given',
      @JsonKey(name: 'firebase_uid') this.firebaseUid = 'no_firebase_uid_given',
      @JsonKey(name: 'photo_url') this.photoUrl = 'no_photo_url_given',
      @JsonKey(name: 'location') this.location = 'no_location_given',
      @JsonKey(name: 'description') this.description = 'no_description_given',
      @JsonKey(name: 'no_of_likes') this.noOfLikes = 0});

  factory _$ComplaintImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComplaintImplFromJson(json);

  @override
  @JsonKey(name: 'complaint_id')
  final int complaintId;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'firebase_uid')
  final String firebaseUid;
  @override
  @JsonKey(name: 'photo_url')
  final String photoUrl;
  @override
  @JsonKey(name: 'location')
  final String location;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'no_of_likes')
  final int noOfLikes;

  @override
  String toString() {
    return 'Complaint(complaintId: $complaintId, createdAt: $createdAt, firebaseUid: $firebaseUid, photoUrl: $photoUrl, location: $location, description: $description, noOfLikes: $noOfLikes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComplaintImpl &&
            (identical(other.complaintId, complaintId) ||
                other.complaintId == complaintId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.firebaseUid, firebaseUid) ||
                other.firebaseUid == firebaseUid) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.noOfLikes, noOfLikes) ||
                other.noOfLikes == noOfLikes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, complaintId, createdAt,
      firebaseUid, photoUrl, location, description, noOfLikes);

  /// Create a copy of Complaint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComplaintImplCopyWith<_$ComplaintImpl> get copyWith =>
      __$$ComplaintImplCopyWithImpl<_$ComplaintImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComplaintImplToJson(
      this,
    );
  }
}

abstract class _Complaint implements Complaint {
  factory _Complaint(
      {@JsonKey(name: 'complaint_id') final int complaintId,
      @JsonKey(name: 'created_at') final String createdAt,
      @JsonKey(name: 'firebase_uid') final String firebaseUid,
      @JsonKey(name: 'photo_url') final String photoUrl,
      @JsonKey(name: 'location') final String location,
      @JsonKey(name: 'description') final String description,
      @JsonKey(name: 'no_of_likes') final int noOfLikes}) = _$ComplaintImpl;

  factory _Complaint.fromJson(Map<String, dynamic> json) =
      _$ComplaintImpl.fromJson;

  @override
  @JsonKey(name: 'complaint_id')
  int get complaintId;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'firebase_uid')
  String get firebaseUid;
  @override
  @JsonKey(name: 'photo_url')
  String get photoUrl;
  @override
  @JsonKey(name: 'location')
  String get location;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'no_of_likes')
  int get noOfLikes;

  /// Create a copy of Complaint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComplaintImplCopyWith<_$ComplaintImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
