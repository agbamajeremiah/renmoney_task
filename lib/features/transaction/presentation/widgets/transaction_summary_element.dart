import 'package:flutter/material.dart';
import 'package:renmoney_task/core/core.dart';

/// [TransactionSummaryElement] display details of a single transaction summary item
class TransactionSummaryElement extends StatelessWidget {
  const TransactionSummaryElement({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextRegular(
            label,
            color: AppColors.lightText,
            fontSize: 14,
          ),
          TextBold(
            value,
            fontSize: 15,
          )
        ],
      ),
    );
  }
}
