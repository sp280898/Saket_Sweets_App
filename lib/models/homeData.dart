import 'package:json_annotation/json_annotation.dart';
import "bannerDetails.dart";
import "categoryDetails.dart";
import "foodItemDetails.dart";
import "addressDetails.dart";
part 'homeData.g.dart';

@JsonSerializable()
class HomeData {
  HomeData();

  late num status;
  late String msg;
  late List<BannerDetails>? banner;
  late List<CategoryDetails>? category;
  late List<FoodItemDetails>? foodItem;
  late AddressDetails? primaryAddress;

  factory HomeData.fromJson(Map<String, dynamic> json) =>
      _$HomeDataFromJson(json);
  Map<String, dynamic> toJson() => _$HomeDataToJson(this);
}
