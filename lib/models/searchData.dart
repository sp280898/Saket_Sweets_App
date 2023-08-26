import 'package:json_annotation/json_annotation.dart';
import "foodItemDetails.dart";
part 'searchData.g.dart';

@JsonSerializable()
class SearchData {
  SearchData();

  late num status;
  late String msg;
  late List<FoodItemDetails> search;
  
  factory SearchData.fromJson(Map<String,dynamic> json) => _$SearchDataFromJson(json);
  Map<String, dynamic> toJson() => _$SearchDataToJson(this);
}
