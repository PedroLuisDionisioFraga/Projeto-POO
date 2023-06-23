import 'package:flutter/material.dart';

class TextFormFieldLayout extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final String? prefixText;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;

  const TextFormFieldLayout({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
    required this.keyboardType,
    required this.textCapitalization,
    this.prefixText,
    this.textInputAction,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 53.5,
      ),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        maxLines: null,
        // Colocando a primeira letra mauiuscula
        textCapitalization: textCapitalization,
        // Mudando o botão de ação (O último inferior esquerdo)
        textInputAction: textInputAction,
        // É tipo o "onPressed()"
        onFieldSubmitted: onFieldSubmitted,
        // Usado para definir o tipo de teclado
        keyboardType: keyboardType,
        //onChanged: (String valure) => retorno da funçao imediatamente após a escrita,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            left: 12,
            right: 12,
            top: 15,
          ),
          icon: Icon(
            icon,
            color: const Color.fromARGB(255, 176, 39, 135),
          ),
          prefixText: prefixText,
          prefixStyle: const TextStyle(
            color: Color.fromARGB(255, 87, 41, 99),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 190, 177, 1),
              width: 1,
            ),
          ),
          //alignLabelWithHint: true,
          labelText: labelText,
          labelStyle: const TextStyle(color: Color.fromARGB(255, 105, 22, 22)),
          floatingLabelStyle: const TextStyle(
            color: Color.fromARGB(255, 105, 22, 22),
          ),
        ),
      ),
    );
  }
}
