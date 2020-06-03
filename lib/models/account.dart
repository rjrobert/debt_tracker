import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable(nullable: false)
class Account {
  final String documentId;
  final String name;
  final double totalAmount;
  final double interest;
  final DateTime dueDate;
  final String userId;

  Account(
    this.documentId,
    this.name,
    this.totalAmount,
    this.interest,
    this.dueDate,
    this.userId,
  );

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
