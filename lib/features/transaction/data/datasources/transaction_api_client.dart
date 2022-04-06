import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'transaction_api_client.g.dart';

/// [TransactionApiClient] is the api client for making the actual network request
@RestApi()
abstract class TransactionApiClient {
  factory TransactionApiClient(
    Dio dio, {
    String baseUrl,
  }) = _TransactionApiClient;

  /// [getTransactions] is the client function for fetching all transactions
  @GET('/investment/3580016662/transactions')
  Future<HttpResponse> getTransactions({
    @Header('Authorization') required String token,
    @Header('Sourceappid') required String appId,
  });
}
