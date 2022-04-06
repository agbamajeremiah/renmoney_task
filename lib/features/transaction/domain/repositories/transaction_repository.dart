import 'package:dartz/dartz.dart';
import 'package:renmoney_task/core/core.dart';

/// [TransactionRepository] is the interface that provides  access
///  to the data layer
abstract class TransactionRepository {
  /// [getTransactions] returns a list of transactions
  Future<Either<Failure, List>> getTransactions();
}
