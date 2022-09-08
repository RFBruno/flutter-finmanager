import 'package:finmanager/models/transction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {

      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0;

      for (var element in recentTransactions) {
        bool sameDay = element.date.day == weekDay.day;
        bool sameMonth = element.date.month == weekDay.month;
        bool sameYear = element.date.year == weekDay.year;

        if(sameDay && sameMonth && sameYear){
          totalSum += element.value;
        }
      }

      print({
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      });
      
      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactions.map((el) {
            return Text("${el['day']} : ${el['value']}");
          }).toList()
      ),
    );
  }
}
