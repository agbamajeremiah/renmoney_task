import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renmoney_task/core/core.dart';
import 'package:renmoney_task/features/transaction/transaction.dart';

void main() {
  configureDependecies();
  runApp(const MyApp());
}

/// The MyApp class
class MyApp extends StatelessWidget {
  /// The [MyApp] constructor
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => sl<TransactionProvider>(),
      child: MaterialApp(
        title: 'Renmoney Task',
        theme: ThemeData(
          fontFamily: 'Product Sans',
          primarySwatch: const MaterialColor(
            0xFF7765C4,
            AppColors.colorScratch,
          ),
        ),
        home: const TransactionsScreen(),
      ),
    );
  }
}
