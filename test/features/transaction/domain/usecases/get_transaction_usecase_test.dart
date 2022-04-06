import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:renmoney_task/core/errors/errors.dart';
import 'package:renmoney_task/core/usecase/usecase.dart';
import 'package:renmoney_task/features/transaction/transaction.dart';

import 'get_transaction_usecase_test.mocks.dart';

@GenerateMocks([TransactionRepository])
void main() {
  late MockTransactionRepository mockTransactionRepository;
  late GetTransactionsUsecase getTransactionsUsecase;

  late TransactionEntity transactionEntity;

  setUp(() {
    mockTransactionRepository = MockTransactionRepository();
    getTransactionsUsecase = GetTransactionsUsecase(mockTransactionRepository);
    transactionEntity = TransactionModel(
      amount: -4000.0,
      balance: '88900',
      type: 'TRANSFER',
      currencyCode: 'NGN',
      entryDate: DateTime.parse("2022-03-09T09:29:00.000"),
      transactionId: 148818,
      comment: "Transfer: Transferred from Olawale Renmoney Account from 3580016662",
    );
  });

  group('getTransactionUsecase', () {
    test('should return right when the request is success', () async {
      when(
        mockTransactionRepository.getTransactions(),
      ).thenAnswer(
        (_) => Future.value(
          Right(
            [transactionEntity],
          ),
        ),
      );
      final result = await getTransactionsUsecase(NoParams());
      verify(mockTransactionRepository.getTransactions());

      expect(
        result.isRight(),
        true,
      );
      verifyNoMoreInteractions(mockTransactionRepository);
    });

    test('should return left when the request is not success', () async {
      when(
        mockTransactionRepository.getTransactions(),
      ).thenAnswer(
        (_) => Future.value(
          const Left(
            ServerFailure(message: 'Server Failure'),
          ),
        ),
      );
      final result = await getTransactionsUsecase(NoParams());
      verify(mockTransactionRepository.getTransactions());

      expect(
        result.isLeft(),
        true,
      );
      verifyNoMoreInteractions(mockTransactionRepository);
    });
  });
}
