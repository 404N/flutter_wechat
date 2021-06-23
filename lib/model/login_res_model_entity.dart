import 'package:flutter_wechat/generated/json/base/json_convert_content.dart';

class LoginResModelEntity with JsonConvert<LoginResModelEntity> {
	List<LoginResModelOtherUsers> otherUsers;
	LoginResModelContactVO contactVO;
	List<AddFriendRequest> addFriendRequestList;
}

class AddFriendRequest with JsonConvert<AddFriendRequest>{
	String ownerId;
	String ownerName;
	String ownerAvatar;
	String otherId;
	int status;
	String sendTime;
}

class LoginResModelOtherUsers with JsonConvert<LoginResModelOtherUsers> {
	String uid;
	String username;
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
