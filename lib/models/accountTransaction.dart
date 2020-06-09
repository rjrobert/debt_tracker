import 'package:json_annotation/json_annotation.dart';

part 'accountTransaction.g.dart';

@JsonSerializable()
class AccountTransaction {
  final String documentId;
  final String accountId;
  final DateTime date;
  final double amount;
  final double interestAmount;
  final double principalAmount;

  AccountTransaction(this.documentId, this.accountId, this.date, this.amount,
      this.interestAmount, this.principalAmount);

  factory AccountTransaction.fromJson(Map<String, dynamic> json) =>
      _$AccountTransactionFromJson(json);
  Map<String, dynamic> toJson() => _$AccountTransactionToJson(this);
}
