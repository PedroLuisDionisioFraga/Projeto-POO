import 'package:flutter/material.dart';

class TransactionDelete extends StatelessWidget {
  final void Function(int) removeTransaction;
  final int idTransaction;

  const TransactionDelete({
    super.key,
    required this.removeTransaction,
    required this.idTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      splashRadius: 25,
      color: Theme.of(context).colorScheme.error,
      onPressed: () => removeTransaction(idTransaction),
    );
  }
}
