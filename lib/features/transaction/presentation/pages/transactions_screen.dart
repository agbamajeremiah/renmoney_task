import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:renmoney_task/core/core.dart';
import 'package:renmoney_task/features/transaction/transaction.dart';

/// [TransactionsScreen] display a list of all transactions

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  void _fetchTransactions() async {
    await sl<TransactionProvider>().fetchTransactions(context);
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, _fetchTransactions);
    super.initState();
  }

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
              Expanded(
                child: Consumer<TransactionProvider>(
                  builder: (context, provider, child) {
                    return provider.clientTransactions == null
                        ? TextBold('No Transactions')
                        : provider.clientTransactions!.isEmpty
                            ? TextBold('No Transactions')
                            : ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: provider.clientTransactions!.length,
                                itemBuilder: (context, index) {
                                  /// [SingleTransactionWidget] show summary for a particular transaction
                                  return SingleTransactionWidget(
                                    item: provider.clientTransactions![index],
                                  );
                                },
                              );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
