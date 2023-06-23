import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionAmount extends StatelessWidget {
  final double purchasePrice;
  //final Widget childContainer;

  const TransactionAmount({
    super.key,
    required this.purchasePrice,
    //required this.childContainer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 90,
      // Serve para eu isolar meu "Container" do resto
      // da minha aplicação nas seguintes distâncias
      alignment: AlignmentDirectional.center,
      // Decorando o "Container"
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      // Distância entre "margin" e "child"
      padding: const EdgeInsets.all(5),
      child: FittedBox(
        child: Text(
          NumberFormat.currency(locale: "pt_Br", name: "R\$")
              .format(purchasePrice),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
