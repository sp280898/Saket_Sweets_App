import 'package:json_annotation/json_annotation.dart';
import "subscriptionDetails.dart";
part 'subscriptionData.g.dart';

@JsonSerializable()
class SubscriptionData {
  SubscriptionData();

  late num status;
  late String msg;
  late List<SubscriptionDetails> sublist;
  
  factory SubscriptionData.fromJson(Map<String,dynamic> json) => _$SubscriptionDataFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionDataToJson(this);
}
