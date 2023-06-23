import 'package:flutter/material.dart';

class MyAppBarStyle extends StatelessWidget implements PreferredSizeWidget {
  final void Function(BuildContext context) openTransactionForm;

  const MyAppBarStyle({
    super.key,
    required this.openTransactionForm,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Despesas Pessoais',
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
              color: Colors.white,
            ),
      ),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => openTransactionForm(context),
        ),
      ],
    );
  }
}
