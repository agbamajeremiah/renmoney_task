import 'dart:async';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:renmoney_task/core/core.dart';
import 'package:renmoney_task/features/transaction/transaction.dart';

/// [TransactionProvider] holds transaction data for the views

@lazySingleton
class TransactionProvider extends ChangeNotifier {
  final GetTransactionsUsecase getTransactionsUsecase;

  TransactionProvider({
    required this.getTransactionsUsecase,
  });

  List<TransactionEntity>? clientTransactions;

  ///[fetchTransactions] FXN that fetches the transaction data in the provider
  Future<void> fetchTransactions(BuildContext context) async {
    final navigator = Navigator.of(context);
    unawaited(sl<AppLoadingPopup>().show(context));
    final result = await getTransactionsUsecase(
      NoParams(),
    );
    navigator.pop();
    result.fold(
      (l) {
        FlushBarNotification.showErrorMessage(
          context: context,
          message: FailureToMessage.mapFailureToMessage(l),
        );
      },
      (r) async {
        clientTransactions = r;
        notifyListeners();
      },
    );
  }
}
