// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trackData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackData _$TrackDataFromJson(Map<String, dynamic> json) => TrackData()
  ..status = json['status'] as num
  ..msg = json['msg'] as String
  ..track = MyOrderDetails.fromJson(json['track'] as Map<String, dynamic>);

Map<String, dynamic> _$TrackDataToJson(TrackData instance) => <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'track': instance.track,
    };
