// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoriesData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesData _$CategoriesDataFromJson(Map<String, dynamic> json) =>
    CategoriesData()
      ..status = json['status'] as num
      ..msg = json['msg'] as String
      ..category = (json['category'] as List<dynamic>)
          .map((e) => CategoryDetails.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$CategoriesDataToJson(CategoriesData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'category': instance.category,
    };
