import 'package:flutter/material.dart';

class ButtonAddTransactionStyle extends StatelessWidget {
  final Widget child;
  final void Function() onPressed;

  const ButtonAddTransactionStyle({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.primary,
      ),
      onPressed: onPressed,
      label: child,
    );
  }
}