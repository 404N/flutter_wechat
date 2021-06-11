import 'package:flutter_wechat/generated/json/base/json_convert_content.dart';

class LoginResModelEntity with JsonConvert<LoginResModelEntity> {
	List<LoginResModelOtherUsers> otherUsers;
	LoginResModelContactVO contactVO;
}

class LoginResModelOtherUsers with JsonConvert<LoginResModelOtherUsers> {
	int uid;
	String username;
	String password;
	String email;
	String avatar;
}

class LoginResModelContactVO with JsonConvert<LoginResModelContactVO> {
	int ownerUid;
	String ownerAvatar;
	String ownerName;
	int totalUnread;
	List<LoginResModelContactVOContactInfoList> contactInfoList;
}

class LoginResModelContactVOContactInfoList with JsonConvert<LoginResModelContactVOContactInfoList> {
	int otherUid;
	String otherName;
	String otherAvatar;
	int mid;
	int type;
	String content;
	int convUnread;
	String createTime;
}
