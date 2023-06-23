import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Widgets/text_button_icon.dart';
import '../Widgets/text_form_field.dart';
import 'modal.dart';

class ShowBarModalBottom extends StatefulWidget {
  final void Function(String, double, DateTime) addTransaction;

  const ShowBarModalBottom({
    super.key,
    required this.addTransaction,
  });

  @override
  State<ShowBarModalBottom> createState() => _ShowBarModalBottomState();
}

class _ShowBarModalBottomState extends State<ShowBarModalBottom> {
  final _title = TextEditingController();
  final _value = TextEditingController();
  DateTime _selectedDay = DateTime.now();
  late String dateFormat;

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Data previamente selecionada
      firstDate: DateTime(2023), // Qual o ano mais novo que ficará disponível pro usuário
      lastDate: DateTime.now(), // Até quando o usuário pode selecionar a data
    ).then((pikedDate) {
      // É chamada quando é clicado em "ok" ou "cancelar"
      pikedDate == null
          ? null
          : setState(() {
              _selectedDay = pikedDate;
            });
    });
  }

  _submitNewTransaction() {
    final textTitle = _title.text;
    final doubleValue = double.tryParse(_value.text) ?? 0.0;

    if (textTitle.isEmpty || doubleValue <= 0) {
      return;
    }
    // "widget" acessa as intâncias da classe pai, ou seja,
    // consegue pegar os valores dos seus construtores
    widget.addTransaction(textTitle, doubleValue, _selectedDay);
  }

  @override
  Widget build(BuildContext context) {
    _title.text = "Aluguel";
    _value.text = "840.23";

    return MyModalStyle(
      modalBody: [
        TextFormFieldLayout(
          controller: _title,
          labelText: "Item(ns) comprado(s)",
          icon: Icons.shopping_bag,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.sentences,
        ),
        const SizedBox(
          height: 15,
        ),
        TextFormFieldLayout(
          controller: _value,
          labelText: "Valor gasto",
          icon: Icons.money,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          prefixText: "R\$ ",
          onFieldSubmitted: (String _) => _submitNewTransaction(),
          textInputAction: TextInputAction.done,
          textCapitalization: TextCapitalization.none,
        ),
        Row(
          children: [
            //ADICIONA NUM ARQUIVO NOVO
            Expanded(
              child: Text(
                "Data Selecionada: ${DateFormat("dd/MM/y").format(_selectedDay)}",
                style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: _showDatePicker,
              child: Text(
                "Mudar a Data!",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: const Color.fromARGB(255, 224, 77, 151),
                      fontSize: 14.3,
                    ),
              ),
            ),
          ],
        ),
        ButtonAddTransactionStyle(
          onPressed: _submitNewTransaction,
          child: Text(
            "Adicionar nova compra",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
