import 'package:json_annotation/json_annotation.dart';

part 'orderDetails.g.dart';

@JsonSerializable()
class OrderDetails {
  OrderDetails();

  late num? id;
  late String? order_date_time;
  late String? estimate_delivarty_time;
  late String? food_id;
  late String? status;
  late String? user_id;
  late String? delivary_address;
  late String? price;
  late String? discount;
  late String? final_price;
  late String? comment;
  late String? payment_type;
  late String? payment_id;
  late String? delivery;
  late String? late_night;
  late String? delivery_charge;
  late String? created_at;
  late String? updated_at;
  late String? deleted_at;

  factory OrderDetails.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailsToJson(this);
}
