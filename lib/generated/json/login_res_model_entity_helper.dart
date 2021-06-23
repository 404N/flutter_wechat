import 'package:flutter_wechat/model/login_res_model_entity.dart';

loginResModelEntityFromJson(LoginResModelEntity data, Map<String, dynamic> json) {
	if (json['otherUsers'] != null) {
		data.otherUsers = (json['otherUsers'] as List).map((v) => LoginResModelOtherUsers().fromJson(v)).toList();
	}
	if (json['contactVO'] != null) {
		data.contactVO = LoginResModelContactVO().fromJson(json['contactVO']);
	}
	if (json['addFriendRequestList'] != null) {
		data.addFriendRequestList = (json['addFriendRequestList'] as List).map((v) => AddFriendRequest().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> loginResModelEntityToJson(LoginResModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['otherUsers'] =  entity.otherUsers?.map((v) => v.toJson())?.toList();
	data['contactVO'] = entity.contactVO?.toJson();
	data['addFriendRequestList'] =  entity.addFriendRequestList?.map((v) => v.toJson())?.toList();
	return data;
}

addFriendRequestFromJson(AddFriendRequest data, Map<String, dynamic> json) {
	if (json['ownerId'] != null) {
		data.ownerId = json['ownerId'].toString();
	}
	if (json['ownerName'] != null) {
		data.ownerName = json['ownerName'].toString();
	}
	if (json['ownerAvatar'] != null) {
		data.ownerAvatar = json['ownerAvatar'].toString();
	}
	if (json['otherId'] != null) {
		data.otherId = json['otherId'].toString();
	}
	if (json['status'] != null) {
		data.status = json['status'] is String
				? int.tryParse(json['status'])
				: json['status'].toInt();
	}
	if (json['sendTime'] != null) {
		data.sendTime = json['sendTime'].toString();
	}
	return data;
}

Map<String, dynamic> addFriendRequestToJson(AddFriendRequest entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ownerId'] = entity.ownerId;
	data['ownerName'] = entity.ownerName;
	data['ownerAvatar'] = entity.ownerAvatar;
	data['otherId'] = entity.otherId;
	data['status'] = entity.status;
	data['sendTime'] = entity.sendTime;
	return data;
}

loginResModelOtherUsersFromJson(LoginResModelOtherUsers data, Map<String, dynamic> json) {
	if (json['uid'] != null) {
		data.uid = json['uid'].toString();
	}
	if (json['username'] != null) {
		data.username = json['username'].toString();
	}
	if (json['email'] != null) {
		data.email = json['email'].toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar'].toString();
	}
	return data;
}

Map<String, dynamic> loginResModelOtherUsersToJson(LoginResModelOtherUsers entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['uid'] = entity.uid;
	data['username'] = entity.username;
	data['email'] = entity.email;
	data['avatar'] = entity.avatar;
	return data;
}

loginResModelContactVOFromJson(LoginResModelContactVO data, Map<String, dynamic> json) {
	if (json['ownerUid'] != null) {
		data.ownerUid = json['ownerUid'].toString();
	}
	if (json['ownerAvatar'] != null) {
		data.ownerAvatar = json['ownerAvatar'].toString();
	}
	if (json['ownerName'] != null) {
		data.ownerName = json['ownerName'].toString();
	}
	if (json['totalUnread'] != null) {
		data.totalUnread = json['totalUnread'].toString();
	}
	if (json['contactInfoList'] != null) {
		data.contactInfoList = (json['contactInfoList'] as List).map((v) => LoginResModelContactVOContactInfoList().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> loginResModelContactVOToJson(LoginResModelContactVO entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ownerUid'] = entity.ownerUid;
	data['ownerAvatar'] = entity.ownerAvatar;
	data['ownerName'] = entity.ownerName;
	data['totalUnread'] = entity.totalUnread;
	data['contactInfoList'] =  entity.contactInfoList?.map((v) => v.toJson())?.toList();
	return data;
}

loginResModelContactVOContactInfoListFromJson(LoginResModelContactVOContactInfoList data, Map<String, dynamic> json) {
	if (json['otherUid'] != null) {
		data.otherUid = json['otherUid'].toString();
	}
	if (json['otherName'] != null) {
		data.otherName = json['otherName'].toString();
	}
	if (json['otherAvatar'] != null) {
		data.otherAvatar = json['otherAvatar'].toString();
	}
	if (json['mid'] != null) {
		data.mid = json['mid'] is String
				? int.tryParse(json['mid'])
				: json['mid'].toInt();
	}
	if (json['type'] != null) {
		data.type = json['type'] is String
				? int.tryParse(json['type'])
				: json['type'].toInt();
	}
	if (json['content'] != null) {
		data.content = json['content'].toString();
	}
	if (json['convUnread'] != null) {
		data.convUnread = json['convUnread'] is String
				? int.tryParse(json['convUnread'])
				: json['convUnread'].toInt();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime'].toString();
	}
	return data;
}

Map<String, dynamic> loginResModelContactVOContactInfoListToJson(LoginResModelContactVOContactInfoList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['otherUid'] = entity.otherUid;
	data['otherName'] = entity.otherName;
	data['otherAvatar'] = entity.otherAvatar;
	data['mid'] = entity.mid;
	data['type'] = entity.type;
	data['content'] = entity.content;
	data['convUnread'] = entity.convUnread;
	data['createTime'] = entity.createTime;
	return data;
}