import 'package:freezed_annotation/freezed_annotation.dart';

import '../../enum/_02_order_status.dart';
import '../_05_item_condition/item_condition.dart';


part 'reusable.freezed.dart';
part 'reusable.g.dart';
//flutter packages pub run build_runner build
@freezed
class Reusable with _$Reusable{
  @JsonSerializable(explicitToJson: true)
  factory Reusable({
    @JsonKey(name: 'id', includeIfNull: false) int? id,
    @Default('no_owner') @JsonKey(name: 'owner') String owner,
    @Default('no_buyer') @JsonKey(name: 'buyer') String buyer,
    @Default('https://images.pexels.com/photos/211492/pexels-photo-211492.jpeg?cs=srgb&dl=pexels-omkar-patyane-211492.jpg&fm=jpg') @JsonKey(name: 'photo_url') String photo_url,
    @Default(0) @JsonKey(name: 'cost') int cost,
    @Default('title') @JsonKey(name: 'title') String title,
    @JsonKey(name: 'item_condition_map')ItemCondition? condition,
    @Default('No pickup address provided')@JsonKey(name: 'pickup_location') String pickup_location,
    @Default(OrderStatus.Approved)@JsonKey(name:'order_status',includeIfNull:false)OrderStatus order_status
  })=_Reusable;
  factory Reusable.fromJson(Map<String, dynamic> json) => _$ReusableFromJson(json);
}

