import 'package:flutter/material.dart';

class MyTextFormField {
  final String? hint;
  final IconData? startIcon;
  final TextEditingController? controller;
  final TextInputAction? inputAction;
  final TextInputType? inputType;
  final FocusNode? focusName;
  final IconButton? suffixIcon;
  final TextCapitalization? capitalization;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final String? helperText;
  final bool obscureText;

  // Constructors
  const MyTextFormField({
    this.controller,
    this.hint,
    this.startIcon,
    this.inputAction,
    this.inputType,
    this.focusName,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.capitalization,
    this.onEditingComplete,
    this.validator,
    this.helperText,
    this.obscureText = false,
  });
  // Para criar a instância da classe
  const MyTextFormField.empty()
      : hint = null,
        startIcon = null,
        controller = null,
        inputAction = null,
        inputType = null,
        focusName = null,
        suffixIcon = null,
        onFieldSubmitted = null,
        capitalization = null,
        onEditingComplete = null,
        validator = null,
        helperText = null,
        obscureText = false;

  Widget inputField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      child: TextFormField(
        focusNode: focusName,
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        maxLines: 1,
        obscureText: obscureText,
        textInputAction: inputAction,
        keyboardType: inputType,
        textCapitalization: capitalization ?? TextCapitalization.none,
        onFieldSubmitted: onFieldSubmitted,
        onEditingComplete: onEditingComplete,
        validator: validator,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              width: 2,
              color: Colors.black87,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 5,
          ),
          fillColor: Colors.black26,
          filled: true,
          hintText: hint,
          suffixIcon: suffixIcon,
          helperText: helperText,
        ),
      ),
    );
  }

  MyTextFormField copyWith({
    String? hint,
    IconData? startIcon,
    TextEditingController? controller,
    TextInputAction? inputAction,
    TextInputType? inputType,
    TextCapitalization? capitalization,
    FocusNode? focusName,
    IconButton? suffixIcon,
    void Function(String)? onFieldSubmitted,
    void Function()? onEditingComplete,
    String? Function(String?)? validator,
    String? helperText,
    bool? obscureText,
  }) {
    return MyTextFormField(
      hint: hint ?? this.hint,
      startIcon: startIcon ?? this.startIcon,
      controller: controller ?? this.controller,
      inputAction: inputAction ?? this.inputAction,
      inputType: inputType ?? this.inputType,
      capitalization: capitalization ?? this.capitalization,
      focusName: focusName ?? this.focusName,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      onFieldSubmitted: onFieldSubmitted ?? this.onFieldSubmitted,
      onEditingComplete: onEditingComplete ?? this.onEditingComplete,
      validator: validator ?? this.validator,
      helperText: helperText ?? this.helperText,
      obscureText: obscureText ?? this.obscureText,
    );
  }
}
