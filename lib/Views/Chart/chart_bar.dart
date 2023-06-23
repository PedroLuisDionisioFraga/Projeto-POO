import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartBar extends StatelessWidget {
  final String dayOfWeek;
  final double valueOfTransaction, percentageOfSpendForTheDay;

  const ChartBar({
    super.key,
    required this.dayOfWeek,
    required this.valueOfTransaction,
    required this.percentageOfSpendForTheDay,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(
              child: Text(
                NumberFormat.currency(locale: "pt_Br", name: "").format(valueOfTransaction),
              ),
            ),
          ),
          SizedBox(height: constraints.maxHeight * 0.05),
          SizedBox(
            height: constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                const ContainerOfChartBar(color: Color.fromARGB(255, 245, 212, 235)),
                FractionallySizedBox(
                  heightFactor: percentageOfSpendForTheDay,
                  child: ContainerOfChartBar(color: Theme.of(context).colorScheme.primary),
                )
              ],
            ),
          ),
          SizedBox(height: constraints.maxHeight * 0.05),
          SizedBox(
            height: constraints.maxHeight * 0.15,
            child: Text(dayOfWeek),
          ),
        ],
      );
    });
  }
}

class ContainerOfChartBar extends StatelessWidget {
  final Color color;

  const ContainerOfChartBar({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
          color: color),
    );
  }
}
