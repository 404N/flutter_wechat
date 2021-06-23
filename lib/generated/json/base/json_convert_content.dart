// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter_wechat/model/user_entity.dart';
import 'package:flutter_wechat/generated/json/user_entity_helper.dart';
import 'package:flutter_wechat/model/login_res_model_entity.dart';
import 'package:flutter_wechat/generated/json/login_res_model_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
			case UserEntity:
				return userEntityFromJson(data as UserEntity, json) as T;
			case LoginResModelEntity:
				return loginResModelEntityFromJson(data as LoginResModelEntity, json) as T;
			case AddFriendRequest:
				return addFriendRequestFromJson(data as AddFriendRequest, json) as T;
			case LoginResModelOtherUsers:
				return loginResModelOtherUsersFromJson(data as LoginResModelOtherUsers, json) as T;
			case LoginResModelContactVO:
				return loginResModelContactVOFromJson(data as LoginResModelContactVO, json) as T;
			case LoginResModelContactVOContactInfoList:
				return loginResModelContactVOContactInfoListFromJson(data as LoginResModelContactVOContactInfoList, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {
			case UserEntity:
				return userEntityToJson(data as UserEntity);
			case LoginResModelEntity:
				return loginResModelEntityToJson(data as LoginResModelEntity);
			case AddFriendRequest:
				return addFriendRequestToJson(data as AddFriendRequest);
			case LoginResModelOtherUsers:
				return loginResModelOtherUsersToJson(data as LoginResModelOtherUsers);
			case LoginResModelContactVO:
				return loginResModelContactVOToJson(data as LoginResModelContactVO);
			case LoginResModelContactVOContactInfoList:
				return loginResModelContactVOContactInfoListToJson(data as LoginResModelContactVOContactInfoList);
			}
			return data as T;
		}
  //Go back to a single instance by type
	static _fromJsonSingle<M>( json) {
		String type = M.toString();
		if(type == (UserEntity).toString()){
			return UserEntity().fromJson(json);
		}	else if(type == (LoginResModelEntity).toString()){
			return LoginResModelEntity().fromJson(json);
		}	else if(type == (AddFriendRequest).toString()){
			return AddFriendRequest().fromJson(json);
		}	else if(type == (LoginResModelOtherUsers).toString()){
			return LoginResModelOtherUsers().fromJson(json);
		}	else if(type == (LoginResModelContactVO).toString()){
			return LoginResModelContactVO().fromJson(json);
		}	else if(type == (LoginResModelContactVOContactInfoList).toString()){
			return LoginResModelContactVOContactInfoList().fromJson(json);
		}	
		return null;
	}

  //list is returned by type
	static M _getListChildType<M>(List data) {
		if(<UserEntity>[] is M){
			return data.map<UserEntity>((e) => UserEntity().fromJson(e)).toList() as M;
		}	else if(<LoginResModelEntity>[] is M){
			return data.map<LoginResModelEntity>((e) => LoginResModelEntity().fromJson(e)).toList() as M;
		}	else if(<AddFriendRequest>[] is M){
			return data.map<AddFriendRequest>((e) => AddFriendRequest().fromJson(e)).toList() as M;
		}	else if(<LoginResModelOtherUsers>[] is M){
			return data.map<LoginResModelOtherUsers>((e) => LoginResModelOtherUsers().fromJson(e)).toList() as M;
		}	else if(<LoginResModelContactVO>[] is M){
			return data.map<LoginResModelContactVO>((e) => LoginResModelContactVO().fromJson(e)).toList() as M;
		}	else if(<LoginResModelContactVOContactInfoList>[] is M){
			return data.map<LoginResModelContactVOContactInfoList>((e) => LoginResModelContactVOContactInfoList().fromJson(e)).toList() as M;
		}
		throw Exception("not fond");
	}

  static M fromJsonAsT<M>(json) {
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json) as M;
    }
  }
}