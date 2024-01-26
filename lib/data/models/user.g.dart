// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      password: json['password'] as String?,
      dob: json['dob'] as String?,
      gender: json['gender'] as String?,
      username: json['username'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) =>
    <String, dynamic>{
      'password': instance.password,
      'dob': instance.dob,
      'gender': instance.gender,
      'username': instance.username,
      'name': instance.name,
    };
