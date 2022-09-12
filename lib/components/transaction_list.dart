import 'package:finmanager/models/transction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList({required this.transactions,required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                'Nenhuma transação cadastrada !',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 40,
              ),
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
                elevation: 5,
                margin:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FittedBox(
                        child: Text('R\$${el.value}',
                            style: Theme.of(context).textTheme.headline4),
                      ),
                    ),
                  ),
                  title: Text(
                    el.title,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  subtitle: Text(DateFormat('d MMM y').format(el.date)),
                  trailing: TextButton(
                    onPressed: ()=> onRemove(el.id),
                    child: Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                ),
              );
            });
  }
}
