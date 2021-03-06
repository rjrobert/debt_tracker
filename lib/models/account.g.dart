// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    json['documentId'] as String,
    json['name'] as String,
    num.tryParse(json['originalAmount'].toString())?.toDouble(),
    num.tryParse(json['currentAmount'].toString())?.toDouble(),
    num.tryParse(json['interest'].toString())?.toDouble(),
    json['dueDate'] == null
        ? null
        : DateTime.tryParse(json['dueDate'].toString()),
    json['userId'] as String,
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'documentId': instance.documentId,
      'name': instance.name,
      'originalAmount': instance.originalAmount,
      'currentAmount': instance.currentAmount,
      'interest': instance.interest,
      'dueDate': instance.dueDate?.toIso8601String(),
      'userId': instance.userId,
    };
