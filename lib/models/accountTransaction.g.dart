// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accountTransaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountTransaction _$AccountTransactionFromJson(Map<String, dynamic> json) {
  return AccountTransaction(
    json['documentId'] as String,
    json['accountId'] as String,
    json['date'] == null ? null : DateTime.parse(json['date'] as String),
    (json['amount'] as num)?.toDouble(),
    (json['interestAmount'] as num)?.toDouble(),
    (json['principalAmount'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$AccountTransactionToJson(AccountTransaction instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'accountId': instance.accountId,
      'date': instance.date?.toIso8601String(),
      'amount': instance.amount,
      'interestAmount': instance.interestAmount,
      'principalAmount': instance.principalAmount,
    };
