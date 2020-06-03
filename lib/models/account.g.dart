// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    json['documentId'] as String,
    json['name'] as String,
    (json['totalAmount'] as num).toDouble(),
    (json['interest'] as num).toDouble(),
    DateTime.parse(json['dueDate'] as String),
    json['userId'] as String,
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'documentId': instance.documentId,
      'name': instance.name,
      'totalAmount': instance.totalAmount,
      'interest': instance.interest,
      'dueDate': instance.dueDate.toIso8601String(),
      'userId': instance.userId,
    };
