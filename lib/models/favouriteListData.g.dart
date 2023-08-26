// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favouriteListData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavouriteListData _$FavouriteListDataFromJson(Map<String, dynamic> json) =>
    FavouriteListData()
      ..status = json['status'] as num
      ..msg = json['msg'] as String
      ..favourite = (json['favourite'] as List<dynamic>)
          .map((e) => FoodItemDetails.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$FavouriteListDataToJson(FavouriteListData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'favourite': instance.favourite,
    };
