import 'package:json_annotation/json_annotation.dart';
import "foodItemDetails.dart";
part 'favouriteListData.g.dart';

@JsonSerializable()
class FavouriteListData {
  FavouriteListData();

  late num status;
  late String msg;
  late List<FoodItemDetails> favourite;
  
  factory FavouriteListData.fromJson(Map<String,dynamic> json) => _$FavouriteListDataFromJson(json);
  Map<String, dynamic> toJson() => _$FavouriteListDataToJson(this);
}
