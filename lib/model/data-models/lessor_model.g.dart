// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessorModel _$LessorModelFromJson(Map<String, dynamic> json) => LessorModel(
      id: (json['id'] as num).toInt(),
      fname: json['fname'] as String,
      lname: json['lname'] as String,
      gender: json['gender'] as String,
      tel: (json['tel'] as num).toInt(),
      isActive: json['isActive'] as bool,
      inCameroon: json['inCameroon'] as bool,
    );

Map<String, dynamic> _$LessorModelToJson(LessorModel instance) =>
    <String, dynamic>{
      // 'id': instance.id,
      'fname': instance.fname,
      'lname': instance.lname,
      'gender': instance.gender,
      'tel': instance.tel,
      'isActive': instance.isActive,
      'inCameroon': instance.inCameroon,
    };
