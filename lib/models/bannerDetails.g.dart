// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bannerDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerDetails _$BannerDetailsFromJson(Map<String, dynamic> json) =>
    BannerDetails()
      ..id = json['id'] as num?
      ..image = json['image'] as String?
      ..tittle = json['tittle'] as String?
      ..category = json['category'] as String?
      ..links = json['links'] as String?
      ..content_active = json['content_active'] as num?
      ..created_at = json['created_at'] as String?
      ..updated_at = json['updated_at'] as String?
      ..deleted_at = json['deleted_at'] as String?;

Map<String, dynamic> _$BannerDetailsToJson(BannerDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'tittle': instance.tittle,
      'category': instance.category,
      'links': instance.links,
      'content_active': instance.content_active,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
    };
