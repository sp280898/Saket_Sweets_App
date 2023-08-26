// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addFavouriteData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFavouriteData _$AddFavouriteDataFromJson(Map<String, dynamic> json) =>
    AddFavouriteData()
      ..status = json['status'] as num
      ..msg = json['msg'] as String
      ..fav = (json['fav'] as List<dynamic>)
          .map((e) => AddFavouriteDetails.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$AddFavouriteDataToJson(AddFavouriteData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'fav': instance.fav,
    };
