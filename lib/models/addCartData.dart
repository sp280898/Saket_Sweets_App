import 'package:json_annotation/json_annotation.dart';
import "addCartDetails.dart";
part 'addCartData.g.dart';

@JsonSerializable()
class AddCartData {
  AddCartData();

  late num status;
  late String msg;
  late List<AddCartDetails> cart;
  
  factory AddCartData.fromJson(Map<String,dynamic> json) => _$AddCartDataFromJson(json);
  Map<String, dynamic> toJson() => _$AddCartDataToJson(this);
}
