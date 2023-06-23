import 'package:intl/intl.dart';

class Data {
  static String addingWords({required String word, String wordToBeAdded = " de "}) {
    String newWord = "";
    bool flag = true;

    for (var i = 0; i < word.length; i++) {
      // Primeira letra maiúscula
      if (i == 0) {
        newWord += word[0].toUpperCase();
      }
      // Vírgula após o nome do dia
      else if (word[i] == " " && flag) {
        newWord += ", ";
        newWord += word[i + 1].toUpperCase();
        flag = false;
        i++;
      }
      // " de " no lugar dos próximos espaços em branco entre palavras
      else if (word[i] == " " && !flag) {
        newWord += " de ";
        newWord += word[i + 1].toUpperCase();
        i++;
      }
      // Acrescentando normalmente a palavra sem alterações
      else {
        newWord += word[i];
      }
    }
    return newWord;
  }

  static String dateFormat(DateTime date) {
    return DateFormat("EEEE d MMMM y", "pt_Br").format(date);
  }
}
