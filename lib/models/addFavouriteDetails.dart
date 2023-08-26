import 'package:json_annotation/json_annotation.dart';

part 'addFavouriteDetails.g.dart';

@JsonSerializable()
class AddFavouriteDetails {
  AddFavouriteDetails();

  late num? id;
  late String? user_id;
  late String? food_id;
  late String? created_at;
  late String? updated_at;
  late String? deleted_at;

  factory AddFavouriteDetails.fromJson(Map<String, dynamic> json) =>
      _$AddFavouriteDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$AddFavouriteDetailsToJson(this);
}
