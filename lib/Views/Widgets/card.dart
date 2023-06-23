import 'package:flutter/material.dart';

class MyCardStyle extends StatelessWidget {
  final Widget childCard;

  const MyCardStyle({
    super.key,
    required this.childCard,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.6,
      margin: const EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 5,
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: Color.fromARGB(255, 252, 61, 188),
          width: 1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      color: const Color.fromARGB(255, 255, 234, 243),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 0,
        ),
        child: childCard,
      ),
    );
  }
}