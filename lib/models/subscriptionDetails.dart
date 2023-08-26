import 'package:json_annotation/json_annotation.dart';

part 'subscriptionDetails.g.dart';

@JsonSerializable()
class SubscriptionDetails {
  SubscriptionDetails();

  late num? id;
  late String? plan_id;
  late String? user_id;
  late String? food_id;
  late String? date_time_start;
  late String? date_time_end;
  late String? is_paid_full;
  late String? is_active;
  late String? date_time_cancel;
  late String? actual_date_time_end;
  late String? payment_type;
  late String? payment_id;
  late String? created_at;
  late String? updated_at;
  late String? deleted_at;
  late String? plan_name;
  late String? plan_type;

  factory SubscriptionDetails.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionDetailsToJson(this);
}
