// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:xml/xml.dart' as xml;

class TrainTimeInfo {
  String trainLineNm; // 출발-도착
  String btrainSttus; // 급행 or 일반
  String statnNm; // 출발지
  String bstatnNm; // 도착지
  int subwayId; // 기차 ID

  TrainTimeInfo({
    required this.trainLineNm,
    required this.btrainSttus,
    required this.statnNm,
    required this.bstatnNm,
    required this.subwayId,
  });

  TrainTimeInfo copyWith({
    String? trainLineNm,
    String? btrainSttus,
    String? statnNm,
    String? bstatnNm,
    int? subwayId,
  }) {
    return TrainTimeInfo(
      trainLineNm: trainLineNm ?? this.trainLineNm,
      btrainSttus: btrainSttus ?? this.btrainSttus,
      statnNm: statnNm ?? this.statnNm,
      bstatnNm: bstatnNm ?? this.bstatnNm,
      subwayId: subwayId ?? this.subwayId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'trainLineNm': trainLineNm,
      'btrainSttus': btrainSttus,
      'statnNm': statnNm,
      'bstatnNm': bstatnNm,
      'subwayId': subwayId,
    };
  }

  factory TrainTimeInfo.fromMap(Map<String, dynamic> map) {
    return TrainTimeInfo(
      trainLineNm: map['trainLineNm'] as String,
      btrainSttus: map['btrainSttus'] as String,
      statnNm: map['statnNm'] as String,
      bstatnNm: map['bstatnNm'] as String,
      subwayId: map['subwayId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TrainTimeInfo.fromJson(String source) =>
      TrainTimeInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  factory TrainTimeInfo.fromXml(xml.XmlElement element) {
    return TrainTimeInfo(
      trainLineNm: element.findElements('trainLineNm').first.innerText,
      btrainSttus: element.findElements('btrainSttus').first.innerText,
      statnNm: element.findElements('statnNm').first.innerText,
      bstatnNm: element.findElements('bstatnNm').first.innerText,
      subwayId: int.parse(element.findElements('subwayId').first.innerText),
    );
  }

  @override
  String toString() {
    return 'TrainTimeInfo(trainLineNm: $trainLineNm, btrainSttus: $btrainSttus, statnNm: $statnNm, bstatnNm: $bstatnNm, subwayId: $subwayId)'; // toString 메서드 수정
  }

  @override
  bool operator ==(covariant TrainTimeInfo other) {
    if (identical(this, other)) return true;

    return other.trainLineNm == trainLineNm &&
        other.btrainSttus == btrainSttus &&
        other.statnNm == statnNm &&
        other.bstatnNm == bstatnNm &&
        other.subwayId == subwayId;
  }

  @override
  int get hashCode {
    return trainLineNm.hashCode ^
        btrainSttus.hashCode ^
        statnNm.hashCode ^
        bstatnNm.hashCode ^
        subwayId.hashCode;
  }
}
