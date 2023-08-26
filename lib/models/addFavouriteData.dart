import 'package:json_annotation/json_annotation.dart';
import "addFavouriteDetails.dart";
part 'addFavouriteData.g.dart';

@JsonSerializable()
class AddFavouriteData {
  AddFavouriteData();

  late num status;
  late String msg;
  late List<AddFavouriteDetails> fav;
  
  factory AddFavouriteData.fromJson(Map<String,dynamic> json) => _$AddFavouriteDataFromJson(json);
  Map<String, dynamic> toJson() => _$AddFavouriteDataToJson(this);
}
