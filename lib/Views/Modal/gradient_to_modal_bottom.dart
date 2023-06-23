
import 'package:flutter/material.dart';

LinearGradient gradientToContainer() {
  return const LinearGradient(
    colors: [
      Color.fromARGB(255, 255, 167, 221),
      Color.fromARGB(255, 252, 213, 243),
      Color.fromARGB(255, 253, 234, 247),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
