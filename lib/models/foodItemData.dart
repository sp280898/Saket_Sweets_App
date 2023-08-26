import 'package:json_annotation/json_annotation.dart';
import "foodItemDetails.dart";
part 'foodItemData.g.dart';

@JsonSerializable()
class FoodItemData {
  FoodItemData();

  late num status;
  late String msg;
  late List<FoodItemDetails> foodItem;
  
  factory FoodItemData.fromJson(Map<String,dynamic> json) => _$FoodItemDataFromJson(json);
  Map<String, dynamic> toJson() => _$FoodItemDataToJson(this);
}
