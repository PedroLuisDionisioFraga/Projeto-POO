import 'package:expense_manager/main.dart';
import 'package:flutter/material.dart';
import '../Models/transaction_models.dart';
import 'package:intl/intl.dart';
import 'Widgets/ListTitleTransaction/transaction_amount.dart';
import 'Widgets/ListTitleTransaction/transaction_date.dart';
import 'Widgets/ListTitleTransaction/transaction_delete.dart';
import 'Widgets/ListTitleTransaction/transaction_title.dart';
import 'Widgets/card.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(int) removeTransaction;

  const TransactionList({
    super.key,
    required this.transactions,
    required this.removeTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 240,
                child: Image.asset(
                  "assets/images/fundo_lista_de_transições_vazia.png",
                  // Definindo o tamanho da imagem
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              // Pegando o conteúdo da lista e pegando o elemento que o index me fornecer
              final transaction = transactions[index];
              final String dateFormat = DateFormat("EEEE d MMMM y", "pt_Br").format(transaction.date ?? DateTime.now());
              return MyCardStyle(
                childCard: ListTile(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Deseja considerar essa despesa como paga?'),
                          actions: [
                            TextButton(
                              child: const Text('Cancelar'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('Está paga'),
                              onPressed: () {
                                mysqlUtils.update(
                                  table: "Status Expense",
                                  updateData: {
                                    "Was_Paid": 1,
                                    "When_was_Paid": DateTime.now(),
                                  },
                                  where: {
                                    "idStatusExpense": index + 1,
                                  }
                                );
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  leading: TransactionAmount(purchasePrice: transaction.purchaseValue),
                  title: TransactionTitle(whatWasBought: transaction.whatWasBought),
                  subtitle: TransactionDate(dateFormat: dateFormat),
                  trailing: TransactionDelete(removeTransaction: removeTransaction, idTransaction: transaction.idTransaction),
                ),
              );
            },
          );
  }
}
