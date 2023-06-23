import 'package:flutter/material.dart';

class FloatingActionButtonStyle extends StatelessWidget {
  final Function(BuildContext context) openTransactionForm;

  const FloatingActionButtonStyle({
    super.key,
    required this.openTransactionForm
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => openTransactionForm(context),
      backgroundColor: const Color.fromARGB(255, 199, 18, 109),
      splashColor: Theme.of(context).splashColor,
      child: Icon(
        Icons.add,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}