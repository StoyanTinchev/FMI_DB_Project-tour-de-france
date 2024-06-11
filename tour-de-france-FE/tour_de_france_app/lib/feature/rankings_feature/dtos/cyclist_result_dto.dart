import 'package:json_annotation/json_annotation.dart';

part 'cyclist_result_dto.g.dart';

@JsonSerializable()
class CyclistResultDTO {
  CyclistResultDTO(
      {required this.registrationNumber,
      required this.cyclistName,
      this.stageNumber = 0,
      this.stageTime = '',
      this.totalTime = ''});

  factory CyclistResultDTO.fromJson(Map<String, dynamic> json) =>
      _$CyclistResultDTOFromJson(json);

  final int registrationNumber;
  final String cyclistName;
  final int stageNumber;
  final String stageTime;
  final String totalTime;

  Map<String, dynamic> toJson() => _$CyclistResultDTOToJson(this);
}