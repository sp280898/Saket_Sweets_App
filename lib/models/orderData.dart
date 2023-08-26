import 'package:json_annotation/json_annotation.dart';
import "orderDetails.dart";
part 'orderData.g.dart';

@JsonSerializable()
class OrderData {
  OrderData();

  late num status;
  late String msg;
  late List<OrderDetails> order;
  
  factory OrderData.fromJson(Map<String,dynamic> json) => _$OrderDataFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDataToJson(this);
}
