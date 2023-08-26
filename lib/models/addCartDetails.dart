import 'package:json_annotation/json_annotation.dart';

part 'addCartDetails.g.dart';

@JsonSerializable()
class AddCartDetails {
  AddCartDetails();

  late num? id;
  late String? user_id;
  late String? food_id;
  late String? plan_id;
  late String? request_tech;
  late String? offer_id;
  late String? quantity;
  late String? price;
  late String? created_at;
  late String? updated_at;
  late String? deleted_at;

  factory AddCartDetails.fromJson(Map<String, dynamic> json) =>
      _$AddCartDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$AddCartDetailsToJson(this);
}
