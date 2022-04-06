import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:renmoney_task/core/core.dart';
import 'package:renmoney_task/features/transaction/transaction.dart';

/// [TransactionDetailsScreen] display details of a single transaction
class TransactionDetailsScreen extends StatelessWidget {
  const TransactionDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPurple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (() => Navigator.pop(context)),
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
              const Gap(23),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextBold(
                          'Transaction details',
                          color: Colors.white,
                        ),
                      ),
                      const Gap(23),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                          top: 36,
                          left: 16,
                          right: 37,
                          bottom: 27,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextRegular(
                              'Detailed summary of transaction',
                              color: AppColors.purple,
                              fontSize: 14,
                            ),
                            const Gap(22),
                            const TransactionSummaryElement(
                              label: 'Recepient',
                              value: 'John',
                            ),
                            const TransactionSummaryElement(
                              label: 'Amount',
                              value: '₦ 50,000',
                            ),
                            const TransactionSummaryElement(
                              label: 'Transaction date',
                              value: '23rd Oct. 2020',
                            ),
                            const TransactionSummaryElement(
                              label: 'Reference',
                              value: '23rd Oct. 2020',
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextRegular(
                                    'Status',
                                    color: AppColors.lightText,
                                    fontSize: 14,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 7,
                                        width: 7,
                                        decoration: const BoxDecoration(
                                          color: AppColors.green,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const Gap(2),
                                      TextBold(
                                        'Successful',
                                        fontSize: 15,
                                        color: AppColors.green,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
