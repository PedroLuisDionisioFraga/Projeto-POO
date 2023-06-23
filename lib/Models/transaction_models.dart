import 'package:expense_manager/Models/user_model.dart';

class Transaction {
  late int id;
  late String whatWasBought;
  late double purchaseValue;
  late DateTime? date;

  Transaction.empty();

  Transaction({
    required this.whatWasBought,
    required this.purchaseValue,
    required this.date,
    required this.id,
  });

  get idTransaction => id;

  static Future<List<Transaction>> getTransaction() async {
    List<dynamic> test = await User.getTransactions();
    List<Transaction> transactions = [];
    Transaction transaction = Transaction.empty();
    for (int i = 0; i < test.length; i++) {
      print(test);
      int j = 0;
      (test[i] as Map<String, dynamic>).forEach((key, value) {
        print(j++);
        key == "idExpense" ? transaction.id = value : null;
        key == "Description" ? transaction.whatWasBought = value : null;
        key == "Date" ? transaction.date = DateTime.now() : null;
        if (key == "Price") {
          transaction.purchaseValue = double.tryParse(value) ?? 0;
          transactions.add(transaction);
        }
      });
    }
    return transactions;
  }
}
