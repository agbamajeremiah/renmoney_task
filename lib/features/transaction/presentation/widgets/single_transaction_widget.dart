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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text.rich(
                      TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'Money Transfer to ',
                            style: TextStyle(
                              color: AppColors.darkText,
                            ),
                          ),
                          TextSpan(
                            text: 'John',
                            style: TextStyle(
                              color: AppColors.purple,
                            ),
                          ),
                        ],
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const Gap(8),
                    TextRegular(
                      '23rd Oct. 2020',
                      fontSize: 11,
                      color: AppColors.lightText,
                    )
                  ],
                ),
              ],
            ),
            TextBold(
              '- ₦ 50,000',
              fontSize: 14,
              color: AppColors.brown,
            )
          ],
        ),
      ),
    );
  }
}
