import 'package:json_annotation/json_annotation.dart';
import "myOrderDetails.dart";
part 'myOrderItemData.g.dart';

@JsonSerializable()
class MyOrderItemData {
  MyOrderItemData();

  late num status;
  late String msg;
  // late List<MyOrderDetails> orderItem;
  late List<MyOrderDetails> item;

  factory MyOrderItemData.fromJson(Map<String, dynamic> json) =>
      _$MyOrderItemDataFromJson(json);
  Map<String, dynamic> toJson() => _$MyOrderItemDataToJson(this);
}
