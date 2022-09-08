import 'package:finmanager/models/transction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: transactions.isEmpty
          ? Column(
              children: [
                const SizedBox(height: 25,),
                Text(
                  'Nenhuma transação cadastrada !',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 40,),
                Expanded(
                  child: Image.asset('assets/images/waiting.png'),
                )
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final el = transactions[index];
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text('R\$ ${el.value.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.headline6),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            el.title,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            DateFormat('d MMM y').format(el.date),
                            style: const TextStyle(color: Colors.blueGrey),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }),
    );
  }
}
