import 'package:freezed_annotation/freezed_annotation.dart';


part 'reusable.freezed.dart';
part 'reusable.g.dart';
//flutter packages pub run build_runner build
@freezed
class Reusable with _$Reusable{
  @JsonSerializable(explicitToJson: true)
  factory Reusable({
    @Default('no_owner') @JsonKey(name: 'owner') String owner,
    @Default('no_buyer') @JsonKey(name: 'buyer') String buyer,
    @Default('https://images.pexels.com/photos/211492/pexels-photo-211492.jpeg?cs=srgb&dl=pexels-omkar-patyane-211492.jpg&fm=jpg') @JsonKey(name: 'photo_url') String photo_url,
    @Default(0) @JsonKey(name: 'cost') int cost,
    @Default('title') @JsonKey(name: 'title') String title,
    @Default(0) @JsonKey(name: 'status') int status,
  })=_Reusable;
  factory Reusable.fromJson(Map<String, dynamic> json) => _$ReusableFromJson(json);
}

