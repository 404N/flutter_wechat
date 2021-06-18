import 'package:flutter_wechat/generated/json/base/json_convert_content.dart';

class UserEntity with JsonConvert<UserEntity> {
	String uid;
	String username;
	String email;
	String avatar;
}
