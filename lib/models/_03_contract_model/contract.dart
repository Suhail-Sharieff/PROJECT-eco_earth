import 'package:freezed_annotation/freezed_annotation.dart';


part 'contract.freezed.dart';
part 'contract.g.dart';
//flutter packages pub run build_runner build
@freezed
class Contract with _$Contract{
  @JsonSerializable(explicitToJson: true)
  factory Contract({
    @JsonKey(name: 'created_at') DateTime? created_at,
    @Default('no-from-id') @JsonKey(name: 'from_id') String from_id,
    @Default('no-to-id') @JsonKey(name: 'to_id') String to_id,
    @Default('no-customer-name') @JsonKey(name: 'customer_name') String customer_name,
    @Default('Pending') @JsonKey(name: 'contract_status') String contract_status,
    @Default({}) @JsonKey(name: 'item_number_map') Map<String,dynamic> item_number_map,
  })=_Contract;
  factory Contract.fromJson(Map<String, dynamic> json) => _$ContractFromJson(json);
}

