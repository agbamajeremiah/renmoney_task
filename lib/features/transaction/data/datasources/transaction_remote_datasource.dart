import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:injectable/injectable.dart';
import 'package:renmoney_task/core/core.dart';
import 'package:renmoney_task/features/transaction/transaction.dart';
import 'transaction_api_client.dart';

/// [TransactionRemoteDataSource] is responsible for retrieving/sending data
///  from/to the remote server.
abstract class TransactionRemoteDataSource {
  /// [getTransactions] returns a list of clients transactions
  Future<List<TransactionModel>> getTransactions();
}

/// [TransactionRemoteDataSourceImpl] implements [TransactionRemoteDataSource]
/// and is responsible for implementing the logics to retrieving/sending data
@LazySingleton(as: TransactionRemoteDataSource)
class TransactionRemoteDataSourceImpl implements TransactionRemoteDataSource {
  TransactionRemoteDataSourceImpl({
    required this.networkInfo,
    required this.dio,
  }) : super() {
    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        logPrint: print, // retry count (optional)
        retryDelays: const [
          Duration(seconds: 1), // wait 1 sec before first retry
          Duration(seconds: 2), // wait 2 sec before second retry
          Duration(seconds: 3), // wait 3 sec before third retry
        ],
      ),
    );
    client = TransactionApiClient(
      dio,
      baseUrl: NetworkCredentials.baseUrl,
    );
  }

  /// [networkInfo] is the network information
  /// that is responsible for checking if the device
  /// is connected to the internet
  /// and returning the status of internet connection if is true/false

  final NetworkInfo networkInfo;

  /// [dio] is used for making http request
  final Dio dio;

  /// [client] is the api client for making the actual network request
  late TransactionApiClient client;

  @override
  Future<List<TransactionModel>> getTransactions() async {
    if (await networkInfo.isConnected) {
      final result = await client.getTransactions(
        token: NetworkCredentials.token,
        appId: NetworkCredentials.sourceAppId,
      );

      return TransactionListModel.fromJson(
              (result.response.data as Map<String, dynamic>)['data'])
          .clientTransactions;
    } else {
      throw NoInternetException();
    }
  }
}
