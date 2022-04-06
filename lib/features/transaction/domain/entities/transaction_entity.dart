import 'package:equatable/equatable.dart';

/// [TransactionEntity] is the entity that represents a transaction
class TransactionEntity extends Equatable {
  final double amount;
  final double balance;
  final String comment;
  final String currencyCode;
  final DateTime entryDate;
  final int transactionId;
  final String type;

  const TransactionEntity({
    required this.amount,
    required this.balance,
    required this.comment,
    required this.currencyCode,
    required this.entryDate,
    required this.transactionId,
    required this.type,
  });

  @override
  List<Object?> get props => [
        amount,
        balance,
        comment,
        currencyCode,
        entryDate,
        transactionId,
        type,
      ];
}
