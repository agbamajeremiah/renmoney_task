import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:renmoney_task/core/core.dart';
import 'package:renmoney_task/features/transaction/transaction.dart';

/// this is the implementation of the [TransactionRepository]
@LazySingleton(as: TransactionRepository)
class TransactionRepositoryImpl implements TransactionRepository {
  /// [TransactionRepositoryImpl] constructor
  TransactionRepositoryImpl(this.transactionRemoteDataSource);

  /// [TransactionRemoteDataSource] is the remote data source
  /// that is responsible for retrieving/sending data
  /// from/to the remote server
  final TransactionRemoteDataSource transactionRemoteDataSource;

  @override
  Future<Either<Failure, List>> getTransactions() async {
    try {
      final response = await transactionRemoteDataSource.getTransactions();
      return Right(response);
    } catch (e) {
      Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().e(e.response!.data);
        if (e.response!.data != null && e.response!.data != '') {
          return Left(
            ServerFailure(
              message: (e.response!.data as Map<String, dynamic>)['error']
                      as String? ??
                  'Service unavailable, please try again!',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      return const Left(ServerFailure(
        message: 'Server error, please try again',
      ));
    }
  }
}
