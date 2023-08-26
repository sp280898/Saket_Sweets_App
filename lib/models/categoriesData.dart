import 'package:json_annotation/json_annotation.dart';
import "categoryDetails.dart";
part 'categoriesData.g.dart';

@JsonSerializable()
class CategoriesData {
  CategoriesData();

  late num status;
  late String msg;
  late List<CategoryDetails> category;
  
  factory CategoriesData.fromJson(Map<String,dynamic> json) => _$CategoriesDataFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesDataToJson(this);
}
