// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singleFoodData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleFoodData _$SingleFoodDataFromJson(Map<String, dynamic> json) =>
    SingleFoodData()
      ..status = json['status'] as num
      ..msg = json['msg'] as String
      ..foodDetail =
          FoodItemDetails.fromJson(json['food-detail'] as Map<String, dynamic>)
      ..favourite = json['favourite'] as num
      ..subfood = (json['subfood'] as List<dynamic>)
          .map((e) => FoodItemDetails.fromJson(e as Map<String, dynamic>))
          .toList()
      ..all = (json['all'] as List<dynamic>)
          .map((e) => FoodItemDetails.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SingleFoodDataToJson(SingleFoodData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'foodDetail': instance.foodDetail,
      'favourite': instance.favourite,
      'subfood': instance.subfood,
      'all': instance.all,
    };
