// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expense_manager/main.dart';

class User {
  final String name;
  final String email;
  final String? password;
  //final List<Transaction> transactions;

  // Constructors
  const User({
    required this.name,
    required this.email,
    this.password,
    //required this.transactions,
  });

  // Methods
  static Future<List<dynamic>> getTransactions() async {
    return await mysqlUtils.getAll(
      table: "Expense E,User U",
      where: "E.User_Email=U.Email",
      limit: 1000,
    );
  }

  static Future<String> getName(String email) async {
    return (await mysqlUtils.getOne(
      table: "User",
      where: {"Email": email},
      fields: "Name",
    ))
        .values
        .first as String;
  }
}
