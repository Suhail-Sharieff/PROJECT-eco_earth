import 'package:freezed_annotation/freezed_annotation.dart';


part 'item_condition.freezed.dart';
part 'item_condition.g.dart';
//flutter packages pub run build_runner build
@freezed
class ItemCondition with _$ItemCondition{
  @JsonSerializable(explicitToJson: true)
  factory ItemCondition({
    // New fields
    @Default('01/01/00') @JsonKey(name: 'purchased_date') String purchased_date,
    @Default(true) @JsonKey(name: 'is_working') bool is_working,
    @Default(false) @JsonKey(name: 'needs_repairs') bool needs_repairs,
  })=_ItemCondition;
  factory ItemCondition.fromJson(Map<String, dynamic> json) => _$ItemConditionFromJson(json);
}

