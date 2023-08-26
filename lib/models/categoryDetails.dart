import 'package:json_annotation/json_annotation.dart';

part 'categoryDetails.g.dart';

@JsonSerializable()
class CategoryDetails {
  CategoryDetails();

  late num? id;
  late String? name;
  late String? image;
  late String? created_at;
  late String? updated_at;
  late String? deleted_at;

  factory CategoryDetails.fromJson(Map<String, dynamic> json) =>
      _$CategoryDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryDetailsToJson(this);
}
