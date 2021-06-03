import 'package:flutter_wechat/model/login_res_model_entity.dart';

loginResModelEntityFromJson(LoginResModelEntity data, Map<String, dynamic> json) {
	if (json['loginUser'] != null) {
		data.loginUser = LoginResModelLoginUser().fromJson(json['loginUser']);
	}
	if (json['otherUsers'] != null) {
		data.otherUsers = (json['otherUsers'] as List).map((v) => LoginResModelOtherUsers().fromJson(v)).toList();
	}
	if (json['contactVO'] != null) {
		data.contactVO = LoginResModelContactVO().fromJson(json['contactVO']);
	}
	return data;
}

Map<String, dynamic> loginResModelEntityToJson(LoginResModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['loginUser'] = entity.loginUser?.toJson();
	data['otherUsers'] =  entity.otherUsers?.map((v) => v.toJson())?.toList();
	data['contactVO'] = entity.contactVO?.toJson();
	return data;
}

loginResModelLoginUserFromJson(LoginResModelLoginUser data, Map<String, dynamic> json) {
	if (json['uid'] != null) {
		data.uid = json['uid'] is String
				? int.tryParse(json['uid'])
				: json['uid'].toInt();
	}
	if (json['username'] != null) {
		data.username = json['username'].toString();
	}
	if (json['password'] != null) {
		data.password = json['password'].toString();
	}
	if (json['email'] != null) {
		data.email = json['email'].toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar'].toString();
	}
	return data;
}

Map<String, dynamic> loginResModelLoginUserToJson(LoginResModelLoginUser entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['uid'] = entity.uid;
	data['username'] = entity.username;
	data['password'] = entity.password;
	data['email'] = entity.email;
	data['avatar'] = entity.avatar;
	return data;
}

loginResModelOtherUsersFromJson(LoginResModelOtherUsers data, Map<String, dynamic> json) {
	if (json['uid'] != null) {
		data.uid = json['uid'] is String
				? int.tryParse(json['uid'])
				: json['uid'].toInt();
	}
	if (json['username'] != null) {
		data.username = json['username'].toString();
	}
	if (json['password'] != null) {
		data.password = json['password'].toString();
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
	data['password'] = entity.password;
	data['email'] = entity.email;
	data['avatar'] = entity.avatar;
	return data;
}

loginResModelContactVOFromJson(LoginResModelContactVO data, Map<String, dynamic> json) {
	if (json['ownerUid'] != null) {
		data.ownerUid = json['ownerUid'] is String
				? int.tryParse(json['ownerUid'])
				: json['ownerUid'].toInt();
	}
	if (json['ownerAvatar'] != null) {
		data.ownerAvatar = json['ownerAvatar'].toString();
	}
	if (json['ownerName'] != null) {
		data.ownerName = json['ownerName'].toString();
	}
	if (json['totalUnread'] != null) {
		data.totalUnread = json['totalUnread'] is String
				? int.tryParse(json['totalUnread'])
				: json['totalUnread'].toInt();
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
		data.otherUid = json['otherUid'] is String
				? int.tryParse(json['otherUid'])
				: json['otherUid'].toInt();
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