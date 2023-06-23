import 'package:flutter/material.dart';

class TransactionTitle extends StatelessWidget {
  final String whatWasBought;

  const TransactionTitle({
    super.key,
    required this.whatWasBought,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      whatWasBought,
      style: Theme.of(context)
          .textTheme
          .displayLarge!
          .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
    );
  }
}
