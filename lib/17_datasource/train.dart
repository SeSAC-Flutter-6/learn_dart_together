class Train {
  String rowNum;
  String selectedCount;
  String totalCount;
  String subwayId;
  String updnLine;
  String trainLineNm;
  String statnFid;
  String statnTid;
  String statnId;
  String statnNm;
  String trnsitCo;
  String ordkey;
  String subwayList;
  String statnList;
  String btrainSttus;
  String barvlDt;
  String btrainNo;
  String bstatnId;
  String bstatnNm;
  String recptnDt;
  String arvlMsg2;
  String arvlMsg3;
  String arvlCd;

  Train({
    required this.rowNum,
    required this.selectedCount,
    required this.totalCount,
    required this.subwayId,
    required this.updnLine,
    required this.trainLineNm,
    required this.statnFid,
    required this.statnTid,
    required this.statnId,
    required this.statnNm,
    required this.trnsitCo,
    required this.ordkey,
    required this.subwayList,
    required this.statnList,
    required this.btrainSttus,
    required this.barvlDt,
    required this.btrainNo,
    required this.bstatnId,
    required this.bstatnNm,
    required this.recptnDt,
    required this.arvlMsg2,
    required this.arvlMsg3,
    required this.arvlCd,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Train &&
        other.rowNum == rowNum &&
        other.selectedCount == selectedCount &&
        other.totalCount == totalCount &&
        other.subwayId == subwayId &&
        other.updnLine == updnLine &&
        other.trainLineNm == trainLineNm &&
        other.statnFid == statnFid &&
        other.statnTid == statnTid &&
        other.statnId == statnId &&
        other.statnNm == statnNm &&
        other.trnsitCo == trnsitCo &&
        other.ordkey == ordkey &&
        other.subwayList == subwayList &&
        other.statnList == statnList &&
        other.btrainSttus == btrainSttus &&
        other.barvlDt == barvlDt &&
        other.btrainNo == btrainNo &&
        other.bstatnId == bstatnId &&
        other.bstatnNm == bstatnNm &&
        other.recptnDt == recptnDt &&
        other.arvlMsg2 == arvlMsg2 &&
        other.arvlMsg3 == arvlMsg3 &&
        other.arvlCd == arvlCd;
  }

  @override
  int get hashCode {
    return rowNum.hashCode ^
        selectedCount.hashCode ^
        totalCount.hashCode ^
        subwayId.hashCode ^
        updnLine.hashCode ^
        trainLineNm.hashCode ^
        statnFid.hashCode ^
        statnTid.hashCode ^
        statnId.hashCode ^
        statnNm.hashCode ^
        trnsitCo.hashCode ^
        ordkey.hashCode ^
        subwayList.hashCode ^
        statnList.hashCode ^
        btrainSttus.hashCode ^
        barvlDt.hashCode ^
        btrainNo.hashCode ^
        bstatnId.hashCode ^
        bstatnNm.hashCode ^
        recptnDt.hashCode ^
        arvlMsg2.hashCode ^
        arvlMsg3.hashCode ^
        arvlCd.hashCode;
  }

  @override
  String toString() {
    return 'Train(rowNum: $rowNum, selectedCount: $selectedCount, totalCount: $totalCount, subwayId: $subwayId, updnLine: $updnLine, trainLineNm: $trainLineNm, statnFid: $statnFid, statnTid: $statnTid, statnId: $statnId, statnNm: $statnNm, trnsitCo: $trnsitCo, ordkey: $ordkey, subwayList: $subwayList, statnList: $statnList, btrainSttus: $btrainSttus, barvlDt: $barvlDt, btrainNo: $btrainNo, bstatnId: $bstatnId, bstatnNm: $bstatnNm, recptnDt: $recptnDt, arvlMsg2: $arvlMsg2, arvlMsg3: $arvlMsg3, arvlCd: $arvlCd)';
  }

  Train copyWith({
    String? rowNum,
    String? selectedCount,
    String? totalCount,
    String? subwayId,
    String? updnLine,
    String? trainLineNm,
    String? statnFid,
    String? statnTid,
    String? statnId,
    String? statnNm,
    String? trnsitCo,
    String? ordkey,
    String? subwayList,
    String? statnList,
    String? btrainSttus,
    String? barvlDt,
    String? btrainNo,
    String? bstatnId,
    String? bstatnNm,
    String? recptnDt,
    String? arvlMsg2,
    String? arvlMsg3,
    String? arvlCd,
  }) {
    return Train(
      rowNum: rowNum ?? this.rowNum,
      selectedCount: selectedCount ?? this.selectedCount,
      totalCount: totalCount ?? this.totalCount,
      subwayId: subwayId ?? this.subwayId,
      updnLine: updnLine ?? this.updnLine,
      trainLineNm: trainLineNm ?? this.trainLineNm,
      statnFid: statnFid ?? this.statnFid,
      statnTid: statnTid ?? this.statnTid,
      statnId: statnId ?? this.statnId,
      statnNm: statnNm ?? this.statnNm,
      trnsitCo: trnsitCo ?? this.trnsitCo,
      ordkey: ordkey ?? this.ordkey,
      subwayList: subwayList ?? this.subwayList,
      statnList: statnList ?? this.statnList,
      btrainSttus: btrainSttus ?? this.btrainSttus,
      barvlDt: barvlDt ?? this.barvlDt,
      btrainNo: btrainNo ?? this.btrainNo,
      bstatnId: bstatnId ?? this.bstatnId,
      bstatnNm: bstatnNm ?? this.bstatnNm,
      recptnDt: recptnDt ?? this.recptnDt,
      arvlMsg2: arvlMsg2 ?? this.arvlMsg2,
      arvlMsg3: arvlMsg3 ?? this.arvlMsg3,
      arvlCd: arvlCd ?? this.arvlCd,
    );
  }

  Map<String, dynamic> toJson() => {
        'rowNum': rowNum,
        'selectedCount': selectedCount,
        'totalCount': totalCount,
        'subwayId': subwayId,
        'updnLine': updnLine,
        'trainLineNm': trainLineNm,
        'statnFid': statnFid,
        'statnTid': statnTid,
        'statnId': statnId,
        'statnNm': statnNm,
        'trnsitCo': trnsitCo,
        'ordkey': ordkey,
        'subwayList': subwayList,
        'statnList': statnList,
        'btrainSttus': btrainSttus,
        'barvlDt': barvlDt,
        'btrainNo': btrainNo,
        'bstatnId': bstatnId,
        'bstatnNm': bstatnNm,
        'recptnDt': recptnDt,
        'arvlMsg2': arvlMsg2,
        'arvlMsg3': arvlMsg3,
        'arvlCd': arvlCd,
      };

  Train.fromJson(Map<String, dynamic> json)
      : rowNum = json['rowNum'],
        selectedCount = json['selectedCount'],
        totalCount = json['totalCount'],
        subwayId = json['subwayId'],
        updnLine = json['updnLine'],
        trainLineNm = json['trainLineNm'],
        statnFid = json['statnFid'],
        statnTid = json['statnTid'],
        statnId = json['statnId'],
        statnNm = json['statnNm'],
        trnsitCo = json['trnsitCo'],
        ordkey = json['ordkey'],
        subwayList = json['subwayList'],
        statnList = json['statnList'],
        btrainSttus = json['btrainSttus'],
        barvlDt = json['barvlDt'],
        btrainNo = json['btrainNo'],
        bstatnId = json['bstatnId'],
        bstatnNm = json['bstatnNm'],
        recptnDt = json['recptnDt'],
        arvlMsg2 = json['arvlMsg2'],
        arvlMsg3 = json['arvlMsg3'],
        arvlCd = json['arvlCd'];
}
