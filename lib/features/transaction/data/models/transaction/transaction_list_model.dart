import 'package:json_annotation/json_annotation.dart';
import 'package:renmoney_task/features/transaction/transaction.dart';
part 'transaction_list_model.g.dart';

/// [TransactionListModel]is the model that represents a list of client transaction
/// and it's used to convert the json response to [TransactionModel] list
///
@JsonSerializable()
class TransactionListModel {
  TransactionListModel({
    required this.clientTransactions,
  });

  final List<TransactionModel> clientTransactions;

  factory TransactionListModel.fromJson(Map<String, dynamic> json) {
    return _$TransactionListModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$TransactionListModelToJson(this);
}
