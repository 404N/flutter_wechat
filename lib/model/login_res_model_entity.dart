import 'package:flutter_wechat/generated/json/base/json_convert_content.dart';

class LoginResModelEntity with JsonConvert<LoginResModelEntity> {
	List<LoginResModelOtherUsers> otherUsers;
	LoginResModelContactVO contactVO;
}

class LoginResModelOtherUsers with JsonConvert<LoginResModelOtherUsers> {
	String uid;
	String username;
	String password;
	String email;
	String avatar;
}

class LoginResModelContactVO with JsonConvert<LoginResModelContactVO> {
	String ownerUid;
	String ownerAvatar;
	String ownerName;
	String totalUnread;
	List<LoginResModelContactVOContactInfoList> contactInfoList;
}

class LoginResModelContactVOContactInfoList with JsonConvert<LoginResModelContactVOContactInfoList> {
	String otherUid;
	String otherName;
	String otherAvatar;
	int mid;
	int type;
	String content;
	int convUnread;
	String createTime;
}
