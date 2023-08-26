import 'package:json_annotation/json_annotation.dart';
import "foodItemDetails.dart";
part 'shortFoodData.g.dart';

@JsonSerializable()
class ShortFoodData {
  ShortFoodData();

  late num status;
  late String msg;
  late List<FoodItemDetails> category;
  
  factory ShortFoodData.fromJson(Map<String,dynamic> json) => _$ShortFoodDataFromJson(json);
  Map<String, dynamic> toJson() => _$ShortFoodDataToJson(this);
}
