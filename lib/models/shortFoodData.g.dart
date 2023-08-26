// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shortFoodData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortFoodData _$ShortFoodDataFromJson(Map<String, dynamic> json) =>
    ShortFoodData()
      ..status = json['status'] as num
      ..msg = json['msg'] as String
      ..category = (json['category'] as List<dynamic>)
          .map((e) => FoodItemDetails.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ShortFoodDataToJson(ShortFoodData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'category': instance.category,
    };
