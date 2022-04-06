import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:renmoney_task/core/core.dart';
import 'package:renmoney_task/features/transaction/transaction.dart';

///[GetTransactionsUsecase] is the usecase that is
/// responsible for retrieving the bus lines
/// from the remote server

@lazySingleton
class GetTransactionsUsecase implements UseCase<List, NoParams> {
  /// [GetTransactionsUsecase] constructor
  GetTransactionsUsecase(this.transactionRepository);

  /// [transactionRepository] is the repository that is responsible for retrieving/sending data
  /// from/to the remote server
  /// and is injected by the [GetTransactionsUsecase]
  final TransactionRepository transactionRepository;

  @override
  Future<Either<Failure, List>> call(NoParams params) {
    return transactionRepository.getTransactions();
  }
}
