import 'package:json_annotation/json_annotation.dart';
import "foodItemDetails.dart";
part 'singleFoodData.g.dart';

@JsonSerializable()
class SingleFoodData {
  SingleFoodData();

  late num status;
  late String msg;
  late FoodItemDetails foodDetail;
  late num favourite;
  late List<FoodItemDetails> subfood;
  late List<FoodItemDetails> all;

  factory SingleFoodData.fromJson(Map<String, dynamic> json) =>
      _$SingleFoodDataFromJson(json);
  Map<String, dynamic> toJson() => _$SingleFoodDataToJson(this);
}
