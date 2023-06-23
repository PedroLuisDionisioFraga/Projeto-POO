import 'package:flutter/material.dart';

import '../../../Models/data_model.dart';

class TransactionDate extends StatelessWidget {

  final String dateFormat;

  const TransactionDate({
    super.key,
    required this.dateFormat,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      Data.addingWords(
        word: dateFormat,
      ),
      style: Theme.of(context).textTheme.displayLarge!.copyWith(
            fontSize: 11,
          )
    );
  }
}
