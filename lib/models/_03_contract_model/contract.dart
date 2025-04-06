import 'package:eco_earth/enum/_02_order_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'contract.freezed.dart';
part 'contract.g.dart';
//flutter packages pub run build_runner build
@freezed
class Contract with _$Contract{
  @JsonSerializable(explicitToJson: true)
  factory Contract({
    @JsonKey(name: 'id', includeIfNull: false) int? id,
    @JsonKey(name: 'created_at',includeIfNull: false) DateTime? created_at,
    @Default('no-from-id') @JsonKey(name: 'from_id') String from_id,
    @Default('no-to-id') @JsonKey(name: 'to_id') String to_id,
    @Default('no-customer-name') @JsonKey(name: 'customer_name') String customer_name,
    @Default({}) @JsonKey(name: 'item_number_map') Map<String,dynamic> item_number_map,
    @Default(OrderStatus.Approved)@JsonKey(name:'order_status',includeIfNull:false)OrderStatus order_status,
  })=_Contract;
  factory Contract.fromJson(Map<String, dynamic> json) => _$ContractFromJson(json);
}

