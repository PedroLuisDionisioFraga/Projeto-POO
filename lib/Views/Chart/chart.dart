import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Models/transaction_models.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  const Chart({
    super.key,
    required this.recentTransaction,
  });

  String capitalizingFirstLetter(String weekDay) {
    String dateWithTheUppercaseFirstLetter = "";

    for (var i = 0; i < weekDay.length - 1; i++) {
      if (i == 0) {
        dateWithTheUppercaseFirstLetter += weekDay[i].toUpperCase();
      } else {
        dateWithTheUppercaseFirstLetter += weekDay[i];
      }
    }

    return dateWithTheUppercaseFirstLetter;
  }

  bool checkingIfTheTransactionIsFromTheCurrenWweek(
      DateTime dayOfRecentTransaction, DateTime weekDay) {
    bool sameDay = dayOfRecentTransaction.day == weekDay.day;
    bool sameMouth = dayOfRecentTransaction.month == weekDay.month;
    bool sameYear = dayOfRecentTransaction.year == weekDay.year;

    bool allInformationValidated = sameDay && sameMouth && sameYear;

    return allInformationValidated;
  }

  List<Map<String, dynamic>> get groupedTransactions =>
      List.generate(7, (index) {
        final weekDays = DateTime.now().subtract(Duration(days: index));
        final dateFormattedInDay = DateFormat("E", "pt_Br").format(weekDays);

        String dateFormattedInDayWithUppercaseFirstLetter =
            capitalizingFirstLetter(dateFormattedInDay);

        double totalSum = 0;
        for (var i = 0; i < recentTransaction.length; i++) {
          if (checkingIfTheTransactionIsFromTheCurrenWweek(
              (DateFormat("d MMMM y", "pt_br").format(recentTransaction[i].date  as DateTime)) as DateTime, weekDays)) {
            totalSum += recentTransaction[i].purchaseValue;
          }
        }

        return {
          "Day": dateFormattedInDayWithUppercaseFirstLetter,
          "ValueTransaction": totalSum
        };
      }).reversed.toList();
  // ".reversed" inverte a lista e retorna um iterávele não uma lista

  List<Map<String, dynamic>> sortedAndGroupedTransactions(
      List<Map<String, dynamic>> groupedAndUnclutteredTransactions) {
    List<Map<String, dynamic>> transitionsSortedByDay = [];
    int i;

    for (i = 0; i < groupedAndUnclutteredTransactions.length; i++) {
      if (groupedAndUnclutteredTransactions[i]["Day"] == "Seg") {
        transitionsSortedByDay.add(groupedAndUnclutteredTransactions[i]);
        groupedAndUnclutteredTransactions.removeAt(i);
      }
    }

    for (i = 0; i < groupedAndUnclutteredTransactions.length; i++) {
      if (groupedAndUnclutteredTransactions[i]["Day"] == "Ter") {
        transitionsSortedByDay.add(groupedAndUnclutteredTransactions[i]);
        groupedAndUnclutteredTransactions.removeAt(i);
      }
    }

    for (i = 0; i < groupedAndUnclutteredTransactions.length; i++) {
      if (groupedAndUnclutteredTransactions[i]["Day"] == "Qua") {
        transitionsSortedByDay.add(groupedAndUnclutteredTransactions[i]);
        groupedAndUnclutteredTransactions.removeAt(i);
      }
    }

    for (i = 0; i < groupedAndUnclutteredTransactions.length; i++) {
      if (groupedAndUnclutteredTransactions[i]["Day"] == "Qui") {
        transitionsSortedByDay.add(groupedAndUnclutteredTransactions[i]);
        groupedAndUnclutteredTransactions.removeAt(i);
      }
    }

    for (i = 0; i < groupedAndUnclutteredTransactions.length; i++) {
      if (groupedAndUnclutteredTransactions[i]["Day"] == "Sex") {
        transitionsSortedByDay.add(groupedAndUnclutteredTransactions[i]);
        groupedAndUnclutteredTransactions.removeAt(i);
      }
    }

    for (i = 0; i < groupedAndUnclutteredTransactions.length; i++) {
      if (groupedAndUnclutteredTransactions[i]["Day"] == "Sáb") {
        transitionsSortedByDay.add(groupedAndUnclutteredTransactions[i]);
        groupedAndUnclutteredTransactions.removeAt(i);
      }
    }

    transitionsSortedByDay.add(groupedAndUnclutteredTransactions[0]);

    return transitionsSortedByDay;
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(
      0,
      (sumAllValues, element) => sumAllValues + element["ValueTransaction"],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      margin: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: sortedAndGroupedTransactions(groupedTransactions).map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                dayOfWeek: e["Day"].toString(),
                valueOfTransaction: e["ValueTransaction"],
                percentageOfSpendForTheDay: _weekTotalValue == 0
                    ? 0
                    : e["ValueTransaction"] / _weekTotalValue,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
