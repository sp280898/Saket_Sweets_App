// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoryDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDetails _$CategoryDetailsFromJson(Map<String, dynamic> json) =>
    CategoryDetails()
      ..id = json['id'] as num?
      ..name = json['name'] as String?
      ..image = json['image'] as String?
      ..created_at = json['created_at'] as String?
      ..updated_at = json['updated_at'] as String?
      ..deleted_at = json['deleted_at'] as String?;

Map<String, dynamic> _$CategoryDetailsToJson(CategoryDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
    };
