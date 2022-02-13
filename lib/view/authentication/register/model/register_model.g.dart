// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      uId: json['uId'] as String?,
      mail: json['mail'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'uId': instance.uId,
      'mail': instance.mail,
      'password': instance.password,
      'name': instance.name,
      'dateOfBirth': instance.dateOfBirth,
      'phoneNumber': instance.phoneNumber,
    };
