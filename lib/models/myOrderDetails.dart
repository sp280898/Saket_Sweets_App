import 'package:json_annotation/json_annotation.dart';

part 'myOrderDetails.g.dart';

@JsonSerializable()
class MyOrderDetails {
  MyOrderDetails();

  late num? id;
  late String? food_name;
  late String? quantity;
  late String? price;
  late String? payment_id;
  late String? user_id;
  late String? Shiprocket_Shipment_Id;
  late String? Shiprocket_Order_Id;
  late String? created_at;
  late String? updated_at;
  late String? deleted_at;
  late String? order_date_time;
  late String? delivery;
  late String? estimate_delivarty_time;
  late num? order_id;
  late String? final_price;
  late String? delivery_charge;
  late String? late_night;
  late String? food_description;
  late String? food_image;
  late String? food_ingredients;
  late String? food_recipe;
  late String? veg_nveg;

  factory MyOrderDetails.fromJson(Map<String, dynamic> json) =>
      _$MyOrderDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$MyOrderDetailsToJson(this);
}
