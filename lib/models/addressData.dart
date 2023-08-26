import 'package:json_annotation/json_annotation.dart';
import "addressDetails.dart";
part 'addressData.g.dart';

@JsonSerializable()
class AddressData {
  AddressData();

  late num status;
  late String msg;
  late List<AddressDetails> address;
  
  factory AddressData.fromJson(Map<String,dynamic> json) => _$AddressDataFromJson(json);
  Map<String, dynamic> toJson() => _$AddressDataToJson(this);
}
