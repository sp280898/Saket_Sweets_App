import 'package:json_annotation/json_annotation.dart';
import "editCartDetailsData.dart";
part 'editCartData.g.dart';

@JsonSerializable()
class EditCartData {
  EditCartData();

  late num status;
  late String msg;
  late EditCartDetailsData cart;
  
  factory EditCartData.fromJson(Map<String,dynamic> json) => _$EditCartDataFromJson(json);
  Map<String, dynamic> toJson() => _$EditCartDataToJson(this);
}
