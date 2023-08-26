// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeData _$HomeDataFromJson(Map<String, dynamic> json) => HomeData()
  ..status = json['status'] as num
  ..msg = json['msg'] as String
  ..banner = json['banner'] == null
      ? null
      : (json['banner'] as List<dynamic>)
          .map((e) => BannerDetails.fromJson(e as Map<String, dynamic>))
          .toList()
  ..category = json['category'] == null
      ? null
      : (json['category'] as List<dynamic>)
          .map((e) => CategoryDetails.fromJson(e as Map<String, dynamic>))
          .toList()
  ..foodItem = json['foodItem'] == null
      ? null
      : (json['foodItem'] as List<dynamic>)
          .map((e) => FoodItemDetails.fromJson(e as Map<String, dynamic>))
          .toList()
  ..primaryAddress = json['primaryAddress'] == null
      ? null
      : AddressDetails.fromJson(json['primaryAddress'] as Map<String, dynamic>);

Map<String, dynamic> _$HomeDataToJson(HomeData instance) => <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'banner': instance.banner,
      'category': instance.category,
      'foodItem': instance.foodItem,
      'primaryAddress': instance.primaryAddress,
    };
