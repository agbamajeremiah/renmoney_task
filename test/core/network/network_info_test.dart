import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:renmoney_task/core/core.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker])
void main() {
  late MockInternetConnectionChecker mockDataCOnnectionChecker;
  late NetworkInfoImpl networkInfoImpl;

  final mockResult = Future.value(true);

  setUp(() {
    mockDataCOnnectionChecker = MockInternetConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(mockDataCOnnectionChecker);
    when(mockDataCOnnectionChecker.hasConnection).thenAnswer(
      (_) => mockResult,
    );
  });

  group('isConnected', () {
    test('should forward the call to DataConnectionChecker.hasConnection',
        () async {
      final result = networkInfoImpl.isConnected;

      verify(mockDataCOnnectionChecker.hasConnection);
      expect(
        result,
        mockResult,
      );
    });
  });
}
