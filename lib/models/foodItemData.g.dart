// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foodItemData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodItemData _$FoodItemDataFromJson(Map<String, dynamic> json) => FoodItemData()
  ..status = json['status'] as num
  ..msg = json['msg'] as String
  ..foodItem = (json['foodItem'] as List<dynamic>)
      .map((e) => FoodItemDetails.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$FoodItemDataToJson(FoodItemData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'foodItem': instance.foodItem,
    };
