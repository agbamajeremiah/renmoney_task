import 'package:flutter_test/flutter_test.dart';
import 'package:renmoney_task/features/transaction/transaction.dart';

void main() {
  final transactionModel = TransactionModel(
    amount: -4000.0,
    balance: '88900',
    type: 'TRANSFER',
    currencyCode: 'NGN',
    entryDate: DateTime.parse("2022-03-09T09:29:00.000"),
    transactionId: 148818,
    comment:
        "Transfer: Transferred from Olawale Renmoney Account from 3580016662",
  );

  test('should be a subclass of TransactionEntity entity', () {
    expect(transactionModel, isA<TransactionEntity>());
  });

  group('json', () {
    test('should return a [UserModel] when the json is valid', () {
      final jsonMap = {
        "transactionId": 148818,
        "type": "TRANSFER",
        "amount": -4000.0,
        "comment":
            "Transfer: Transferred from Olawale Renmoney Account from 3580016662",
        "entryDate": "2022-03-09T09:29:00.000",
        "currencyCode": "NGN",
        "balance": "88900"
      };

      final result = TransactionModel.fromJson(jsonMap);

      expect(result, transactionModel);
    });

    test('should return a json object of user model', () {
      final result = transactionModel.toJson();

      expect(result, {
        "transactionId": 148818,
        "type": "TRANSFER",
        "amount": -4000.0,
        "comment":
            "Transfer: Transferred from Olawale Renmoney Account from 3580016662",
        "entryDate": "2022-03-09T09:29:00.000",
        "currencyCode": "NGN",
        "balance": "88900"
      });
    });
  });
}
