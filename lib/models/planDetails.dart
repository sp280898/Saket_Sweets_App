import 'package:json_annotation/json_annotation.dart';

part 'planDetails.g.dart';

@JsonSerializable()
class PlanDetails {
  PlanDetails();

  late num? id;
  late String? valid_date_time_from;
  late String? valid_date_time_to;
  late String? name;
  late String? type;
  late String? price;
  late String? advance_price;
  late String? offer_discount;
  late String? created_at;
  late String? updated_at;
  late String? deleted_at;

  factory PlanDetails.fromJson(Map<String, dynamic> json) =>
      _$PlanDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$PlanDetailsToJson(this);
}
