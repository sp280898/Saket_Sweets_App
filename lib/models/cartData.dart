import 'package:json_annotation/json_annotation.dart';
import "foodItemDetails.dart";
part 'cartData.g.dart';

@JsonSerializable()
class CartData {
  CartData();

  late num status;
  late String msg;
  late List<FoodItemDetails> cart;
  
  factory CartData.fromJson(Map<String,dynamic> json) => _$CartDataFromJson(json);
  Map<String, dynamic> toJson() => _$CartDataToJson(this);
}
