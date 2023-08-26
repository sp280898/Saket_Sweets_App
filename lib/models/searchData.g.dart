// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searchData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchData _$SearchDataFromJson(Map<String, dynamic> json) => SearchData()
  ..status = json['status'] as num
  ..msg = json['msg'] as String
  ..search = (json['search'] as List<dynamic>)
      .map((e) => FoodItemDetails.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$SearchDataToJson(SearchData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'search': instance.search,
    };
