import 'package:freezed_annotation/freezed_annotation.dart';


part 'vendor.freezed.dart';
part 'vendor.g.dart';
//flutter packages pub run build_runner build
@freezed
class Vendor with _$Vendor{
  @JsonSerializable(explicitToJson: true)
  factory Vendor({
    @Default('no_firebase_uid_given') @JsonKey(name: 'firebase_uid') String firebaseUid,
    @Default('no_vendor_name_given') @JsonKey(name: 'vendor_name') String vendor_name,
    @Default('no_location_given') @JsonKey(name: 'vendor_location') String vendor_location,
    @Default('no_shop_name_given') @JsonKey(name: 'vendor_shop_name') String vendor_shop_name,
    @Default(0) @JsonKey(name: 'vendor_rating') int rating,
    @Default('+91 12345 67890') @JsonKey(name: 'vendor_phone_number') String vendor_phone_number,
    @Default({'e-waste':110,}) @JsonKey(name: 'type_cost_map') Map<String,dynamic> types_cost_map,
})=_Vendor;
  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);
}
