import 'package:json_annotation/json_annotation.dart';

part 'foodItemDetails.g.dart';

@JsonSerializable()
class FoodItemDetails {
  FoodItemDetails();

  late num? id;
  late String? name;
  late String? category;
  late String? type;
  late String? description;
  late String? image;
  late String? ingredients;
  late String? recipe;
  late String? active;
  late String? status;
  late String? price;
  late String? mainprice;
  late String? subfood_id;
  late String? available_plans;
  late String? available_offer;
  late String? max_quantity;
  late String? times_to_delivery_chrage;
  late String? veg_nveg;
  late String? shop_user;
  late String? retailer_price;
  late String? wholesaler_price;
  late String? created_at;
  late String? updated_at;
  late String? deleted_at;
  late String? quantity;
  late String? total_price;
  late num? cart_id;
  late num? fav_id;

  factory FoodItemDetails.fromJson(Map<String, dynamic> json) =>
      _$FoodItemDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$FoodItemDetailsToJson(this);
}
