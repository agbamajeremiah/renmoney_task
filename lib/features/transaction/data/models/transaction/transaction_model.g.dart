// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      amount: (json['amount'] as num).toDouble(),
      balance: (json['balance'] as num).toDouble(),
      comment: json['comment'] as String,
      currencyCode: json['currencyCode'] as String,
      entryDate: DateTime.parse(json['entryDate'] as String),
      transactionId: json['transactionId'] as int,
      type: json['type'] as String,
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'balance': instance.balance,
      'comment': instance.comment,
      'currencyCode': instance.currencyCode,
      'entryDate': instance.entryDate.toIso8601String(),
      'transactionId': instance.transactionId,
      'type': instance.type,
    };
