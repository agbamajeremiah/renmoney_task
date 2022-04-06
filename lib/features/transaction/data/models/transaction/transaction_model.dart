import 'package:json_annotation/json_annotation.dart';
import 'package:renmoney_task/features/transaction/domain/entities/transaction_entity.dart';
part 'transaction_model.g.dart';

/// [TransactionModel]is the model that represents a transdaction
/// and it's used to convert the json response to [TransactionModel]
/// it's a subclass of [TransactionEntity]

@JsonSerializable()
class TransactionModel extends TransactionEntity {
  const TransactionModel({
    required double amount,
    required String balance,
    required String? comment,
    required String currencyCode,
    required DateTime entryDate,
    required int transactionId,
    required String type,
  }) : super(
          amount: amount,
          balance: balance,
          comment: comment,
          currencyCode: currencyCode,
          entryDate: entryDate,
          transactionId: transactionId,
          type: type,
        );

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return _$TransactionModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}
