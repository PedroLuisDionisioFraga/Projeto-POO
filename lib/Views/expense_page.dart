// import 'package:expense_manager/Controllers/Screen/screen_size.dart';
// import 'package:flutter/material.dart';

// import '../Components/Transaction_list/transaction_list.dart';
// import '../Components/chart/chart.dart';

// // TODO: Implementar as funções ou localmente ou pegar via parâmetros do construtor
// class ExpensePage extends StatelessWidget {
//   const ExpensePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final double appBarHeight = ScreenSize.appBarHeight(context);  // Acho q é assim
//     final double screenHeight = ScreenSize.maxHeight(context);
//     final double paddingTopHeight = ScreenSize.paddingTop(context);
//     final double availableHeight = screenHeight - appBarHeight - paddingTopHeight;

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(
//               height: availableHeight * 0.3,
//               child: Chart(recentTransaction: _recentTransaction),
//             ),
//             SizedBox(
//               height: availableHeight * 0.55,
//               child: TransactionList(transactions: _transactions, removeTransaction: _removeTransaction),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _openTransactionForm(context),
//         backgroundColor: const Color.fromARGB(255, 199, 18, 109),
//         splashColor: Theme.of(context).splashColor,
//         child: Icon(
//           Icons.add,
//           color: Theme.of(context).iconTheme.color,
//         ),
//       ),
//     );
//   }
// }
