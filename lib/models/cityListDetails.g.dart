// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cityListDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityListDetails _$CityListDetailsFromJson(Map<String, dynamic> json) =>
    CityListDetails()
      ..city = (json['city'] as List<dynamic>).map((e) => e as String).toList();

Map<String, dynamic> _$CityListDetailsToJson(CityListDetails instance) =>
    <String, dynamic>{
      'city': instance.city,
    };
