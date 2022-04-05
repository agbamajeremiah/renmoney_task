import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:renmoney_task/core/core.dart';
import 'package:renmoney_task/features/transaction/transaction.dart';

/// [TransactionsScreen] display a list of all transactions

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 30,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  TextBold(
                    'All Transactions',
                    color: AppColors.purple,
                  ),
                ],
              ),
              const Gap(23),

              /// [SingleTransactionWidget] show summary for a particular transaction
              const SingleTransactionWidget()
            ],
          ),
        ),
      ),
    );
  }
}
