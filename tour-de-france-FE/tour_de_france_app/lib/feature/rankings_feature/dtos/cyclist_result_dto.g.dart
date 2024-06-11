// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cyclist_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CyclistResultDTO _$CyclistResultDTOFromJson(Map<String, dynamic> json) =>
    CyclistResultDTO(
      registrationNumber: (json['registrationNumber'] as num).toInt(),
      cyclistName: json['cyclistName'] as String,
      stageNumber: (json['stageNumber'] as num?)?.toInt() ?? 0,
      stageTime: json['stageTime'] as String? ?? '',
      totalTime: json['totalTime'] as String? ?? '',
    );

Map<String, dynamic> _$CyclistResultDTOToJson(CyclistResultDTO instance) =>
    <String, dynamic>{
      'registrationNumber': instance.registrationNumber,
      'cyclistName': instance.cyclistName,
      'stageNumber': instance.stageNumber,
      'stageTime': instance.stageTime,
      'totalTime': instance.totalTime,
    };
