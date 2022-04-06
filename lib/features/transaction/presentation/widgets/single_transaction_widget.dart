import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:renmoney_task/core/core.dart';
import 'package:renmoney_task/features/transaction/transaction.dart';

/// [SingleTransactionWidget] show summary for a particular transaction

class SingleTransactionWidget extends StatelessWidget {
  const SingleTransactionWidget({
    Key? key,
    required this.item,
  }) : super(key: key);
  final TransactionEntity item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TransactionDetailsScreen(),
            ),
          )),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(
          vertical: 17,
          horizontal: 13,
        ),
        decoration: BoxDecoration(
          color: AppColors.background2,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: AppColors.purple.withOpacity(0.10),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AppAssets.arrowDown,
                      ),
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: item.comment,
                                style: const TextStyle(
                                  color: AppColors.darkText,
                                ),
                              ),
                              // TextSpan(
                              //   text: 'John',
                              //   style: const TextStyle(
                              //     color: AppColors.purple,
                              //   ),
                              // ),
                            ],
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                            ),
                          ),
                          maxLines: 1,
                        ),
                        const Gap(8),
                        TextRegular(
                          DateUtil.formatDisplayDate(item.entryDate),
                          fontSize: 11,
                          color: AppColors.lightText,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Gap(5),
            Expanded(
              flex: 1,
              child: TextBold(
                AmountUtil.formatAmount(item.amount),
                fontSize: 14,
                color: AppColors.brown,
                textAlign: TextAlign.right,
              ),
            )
          ],
        ),
      ),
    );
  }
}
