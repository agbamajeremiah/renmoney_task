// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionListModel _$TransactionListModelFromJson(
        Map<String, dynamic> json) =>
    TransactionListModel(
      clientTransactions: (json['clientTransactions'] as List<dynamic>)
          .map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionListModelToJson(
        TransactionListModel instance) =>
    <String, dynamic>{
      'clientTransactions': instance.clientTransactions,
    };
