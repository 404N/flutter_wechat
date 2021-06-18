import 'dart:convert';

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class GroupMsgVo {
  GroupMsgVo({
    this.mid,
    this.content,
    this.ownerUid,
    this.groupId,
    this.createTime,
    this.avatar,
    this.ownerName,
  });

  factory GroupMsgVo.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : GroupMsgVo(
    mid: asT<int>(jsonRes['mid']),
    content: asT<String>(jsonRes['content']),
    ownerUid: asT<String>(jsonRes['ownerUid']),
    groupId: asT<String>(jsonRes['groupId']),
    createTime: asT<String>(jsonRes['createTime']),
    avatar: asT<String>(jsonRes['avatar']),
    ownerName: asT<String>(jsonRes['ownerName']),
  );

  int mid;
  String content;
  String ownerUid;
  String groupId;
  String createTime;
  String avatar;
  String ownerName;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'mid': mid,
    'content': content,
    'ownerUid': ownerUid,
    'groupId': groupId,
    'createTime': createTime,
    'avatar': avatar,
    'ownerName': ownerName,
  };

  GroupMsgVo clone() => GroupMsgVo.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this))));
}
