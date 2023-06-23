import 'package:expense_manager/Models/data_model.dart';
import 'package:expense_manager/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'transaction_list.dart';
import 'Modal/modal_to_add_new_transactions.dart';
import '../Controllers/Screen/screen_size.dart';
import '../Models/transaction_models.dart';
import 'Widgets/app_bar.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key});

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  // Tamanho da AppBar
  late double appBarHeight;
  List<Transaction> transactions = [];

  _addTransaction(String title, double value, DateTime date) async {
    final newTransaction = Transaction(
      whatWasBought: title,
      purchaseValue: value,
      date: date,
      id: transactions.length,
    );

    setState(() {
      transactions.add(newTransaction);
    });
    await mysqlUtils.insert(
      table: "Status Expense",
      insertData: {
        "Was_Paid": 0,
      },
    );
    final idStatusExpense = (await mysqlUtils.max(
      table: "Status Expense",
      fields: "idStatusExpense",
    ));
    mysqlUtils.insert(
      table: "Expense",
      insertData: {
        "Description": title,
        "Date": Data.dateFormat(date),
        "Price": value,
        "User_Email": user.email,
        "Status_Expense_idStatusExpense": idStatusExpense,
      },
    );
    // Fechando o teclado
    Navigator.of(context).pop();
  }

  _removeTransaction(int id) {
    mysqlUtils.delete(
      table: "ExpansiveManager",
      where: {"idExpense": id},
    );
    setState(() {
      transactions.removeWhere((transaction) => transaction.idTransaction == id);
    });
  }

  _openTransactionForm(BuildContext context) {
    // Builder é o layout do modal
    showModalBottomSheet(
      //duration: Duration(milliseconds: 600),
      isScrollControlled: true,
      context: context,
      builder: (context) => ShowBarModalBottom(addTransaction: _addTransaction),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      appBarHeight = ScreenSize.appBarHeight();
    });
    Transaction.getTransaction().then((value) {
      setState(() {
        transactions = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Definindo o local pra poder fazer a conversão de moeda
    initializeDateFormatting("pt_Br");

    final double screenHeight = MediaQuery.of(context).size.height;
    final double paddingTopHeight = MediaQuery.of(context).padding.top;
    final double availableHeight = screenHeight - appBarHeight - paddingTopHeight;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      // É usada para esconde appBar qnd descer no list
      appBar: MyAppBarStyle(openTransactionForm: _openTransactionForm),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // SizedBox(
            //   height: availableHeight * 0.3,
            //   child: Chart(recentTransaction: _recentTransaction),
            // ),
            SizedBox(
              height: availableHeight * 0.55,
              child: TransactionList(transactions: transactions, removeTransaction: _removeTransaction),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openTransactionForm(context);
        },
        backgroundColor: const Color.fromARGB(255, 199, 18, 109),
        splashColor: Theme.of(context).splashColor,
        child: Icon(
          Icons.add,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
