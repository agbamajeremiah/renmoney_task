import 'package:renmoney_task/features/transaction/transaction.dart';

/// [TransactionListModel]is the model that represents a list of client transaction
/// and it's used to convert the json response to [TransactionModel] list

class TransactionListModel {
  TransactionListModel({
    required this.clientTransactions,
  });

  final List<TransactionModel> clientTransactions;

  factory TransactionListModel.fromJson(Map<String, dynamic> json) =>
      TransactionListModel(
        clientTransactions: List<TransactionModel>.from(
            json["clientTransactions"]
                .map((x) => TransactionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "clientTransactions":
            List<dynamic>.from(clientTransactions.map((x) => x.toJson())),
      };
}
