import 'dart:convert';

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class MessageVo {
  MessageVo({
    this.mid,
    this.content,
    this.ownerUid,
    this.type,
    this.otherUid,
    this.createTime,
    this.ownerUidAvatar,
    this.otherUidAvatar,
    this.ownerName,
    this.otherName,
  });

  int mid;
  String content;
  int ownerUid;
  int type;
  int otherUid;
  String createTime;
  String ownerUidAvatar;
  String otherUidAvatar;
  String ownerName;
  String otherName;

  factory MessageVo.fromJson(Map<String, dynamic> jsonRes) => MessageVo(
    mid: asT<int>(jsonRes['mid']),
    content: asT<String>(jsonRes['content']),
    ownerUid: asT<int>(jsonRes['ownerUid']),
    type: asT<int>(jsonRes['type']),
    otherUid: asT<int>(jsonRes['otherUid']),
    createTime: asT<String>(jsonRes['createTime']),
    ownerUidAvatar: asT<String>(jsonRes['ownerUidAvatar']),
    otherUidAvatar: asT<String>(jsonRes['otherUidAvatar']),
    ownerName: asT<String>(jsonRes['ownerName']),
    otherName: asT<String>(jsonRes['otherName']),
  );


  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'mid': mid,
    'content': content,
    'ownerUid': ownerUid,
    'type': type,
    'otherUid': otherUid,
    'createTime': createTime,
    'ownerUidAvatar': ownerUidAvatar,
    'otherUidAvatar': otherUidAvatar,
    'ownerName': ownerName,
    'otherName': otherName,
  };

  MessageVo clone() => MessageVo.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this))));
}
