// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addFavouriteDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFavouriteDetails _$AddFavouriteDetailsFromJson(Map<String, dynamic> json) =>
    AddFavouriteDetails()
      ..id = json['id'] as num?
      ..user_id = json['user_id'] as String?
      ..food_id = json['food_id'] as String?
      ..created_at = json['created_at'] as String?
      ..updated_at = json['updated_at'] as String?
      ..deleted_at = json['deleted_at'] as String?;

Map<String, dynamic> _$AddFavouriteDetailsToJson(
        AddFavouriteDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'food_id': instance.food_id,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
    };
