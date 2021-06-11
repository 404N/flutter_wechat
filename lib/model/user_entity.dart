import 'package:flutter_wechat/generated/json/base/json_convert_content.dart';

class UserEntity with JsonConvert<UserEntity> {
	int uid;
	String username;
	String email;
	String avatar;
}
